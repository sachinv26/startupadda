import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class ProfilePage extends StatefulWidget {
  String category;
  ProfilePage(this.category);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
    FirebaseFirestore.instance.collection(widget.category).snapshots();
    return
      // Container(
      //     decoration: BoxDecoration(
      //         image: DecorationImage(
      //             image: NetworkImage("assets/images/bg3.png"), fit: BoxFit.cover)),
      //     child:

      Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.category)
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                ),
              ),
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
                  return
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ReusableDetailcard(fullname: data['name'], ph_no: data['ph'], email: data['email'], profile: data['linkedin'])
                      // ListTile(
                      //
                      //     tileColor: Colors.black12,
                      //     leading: const Icon(Icons.person),
                      //     // trailing: Text(
                      //     //   Random().nextInt(10).toString(),
                      //     //   style: TextStyle(color: Colors.green, fontSize: 15),
                      //     // ),
                      //     title: Text(data['name'])),
                    );
                }).toList(),
              ),
            );
          },
        ),
      );
  }
}



class ReusableDetailcard extends StatelessWidget {
  String fullname;
  String ph_no;
  String email;
  String profile;

  ReusableDetailcard({Key?key,required this.fullname,required this.ph_no,required this.email, required this.profile}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 20,
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1,),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10.0),
      child: Expanded(
        child: Container(
          height: 170,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 15,
              ),
              const CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                child: Icon(Icons.person,size: 40,),
              ),
              const SizedBox(
                width: 70,
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20,top: 40),
                    child: Text(fullname,style: const TextStyle(
                        color: Colors.white
                    ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20,),
                    child: Text(ph_no,style: const TextStyle(
                        color: Colors.white
                    ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20,),
                    child: Text(email,style: const TextStyle(
                        color: Colors.white
                    ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
