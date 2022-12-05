import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:startupadda/auth_screens/auth_methods.dart';

class InvestorHomePage extends StatefulWidget {
  const InvestorHomePage({Key? key}) : super(key: key);

  @override
  State<InvestorHomePage> createState() => _InvestorHomePageState();
}

class _InvestorHomePageState extends State<InvestorHomePage> {
   Color color= Colors.red;
  final Stream<QuerySnapshot> usersStream =
  FirebaseFirestore.instance.collection('ideahub').snapshots();

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore.instance
    //     .collection("ideahub")
    //     .doc('userid')
    //     .get()
    //     .then((value) => print(value['name']));
    // print(usersStream);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Idea Hub Home'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView(
                      children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        //print(document);
                        Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onDoubleTap: (){

                              setState(() {
                                color= Colors.green;
                              });
                            },
                              onTap: () {
                                showDesc(data, context);
                              },
                              child: ideaBox(
                                  data['name'], data['description'], context,color)),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

Widget ideaBox(String s1, String s2, BuildContext context, Color color) {
  return Container(

    color: color,
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
    height: 120,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Text(s1),
        const SizedBox(
          height: 10,
        ),
        Text(s2),
      ],
    ),
  );
}

showDesc(Map<String, dynamic> map, BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    barrierColor: Colors.transparent.withOpacity(0.5),
    backgroundColor: Colors.white,
    elevation: 1000,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: ListView(
            children: <Widget>[
              Center(
                child: Text(
                  'My Note',
                  style: TextStyle(color: Colors.red[400]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      map['name'],
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      map['email'],
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      map['description'],
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      map['domain'],
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      map['req'],
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}