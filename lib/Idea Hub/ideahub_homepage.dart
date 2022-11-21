import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './add_idea.dart';
import 'package:startupadda/auth_screens/auth_methods.dart';

class IdeaHubHome extends StatefulWidget {
  const IdeaHubHome({Key? key}) : super(key: key);

  @override
  State<IdeaHubHome> createState() => _IdeaHubHomeState();
}

class _IdeaHubHomeState extends State<IdeaHubHome> {
  final Stream<QuerySnapshot> usersStream =
  FirebaseFirestore.instance.collection('ideahub').snapshots();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("ideahub")
        .doc('userid')
        .get()
        .then((value) => print(value['name']));
    print(usersStream);
    return Scaffold(
      appBar: AppBar(
        title: Text('Idea Hub Home'),
      ),
      body: Column(
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
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: const CircularProgressIndicator());
                  }

                  return ListView(
                    children:
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      print(document);
                      Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                            onTap: () {
                              showDesc(data, context);
                            },
                            child: ideaBox(
                                data['name'], data['description'], context)),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => UploadForm()));
          },
          child: Icon(Icons.add)),
    );
  }
}

Widget ideaBox(String s1, String s2, BuildContext context) {
  return Container(
    color: Colors.cyanAccent,
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
    height: MediaQuery.of(context).size.height * 0.12,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Text(s1),
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
                      map['description'],
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      map['name'],
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      map['domain'],
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      map['email'],
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      map['req'],
                      style: TextStyle(fontSize: 20),
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