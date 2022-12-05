import 'package:flutter/material.dart';
import 'package:startupadda/profiles/registration.dart';
import 'package:startupadda/teams/teamshome.dart';

class EntrepreneurHomePage extends StatefulWidget {
  const EntrepreneurHomePage({Key? key}) : super(key: key);

  @override
  State<EntrepreneurHomePage> createState() => _EntrepreneurHomePageState();
}

class _EntrepreneurHomePageState extends State<EntrepreneurHomePage> {
  @override
  Widget build(BuildContext context) {
    final Team = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TeamHome()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.all(12),
          ),
          child: Text(
            'Find a Team',
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
      ),
    );
    final register = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterProfile()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.all(12),
          ),
          child: Text(
            'Regitser your self',
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Entreprenuerial Hub'),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        body: Container(
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
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 250),
              child: Column(
                children: [
                  Column(
                    children: <Widget>[
                      Team,
                      register
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
