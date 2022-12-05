import 'package:flutter/material.dart';
import 'package:startupadda/Idea%20Hub/ideahub_homepage.dart';
import 'package:startupadda/Investor%20Hub/investor_homepage.dart';
import './auth_screens/login_register_query.dart';
import 'package:startupadda/Entreprenuerial Hub/Entrepreneurial_home.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final entrepreneur = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EntrepreneurHomePage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.all(12),
          ),
          child: Text(
            'Entreprenuerial Hub',
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
      ),
    );
    final ideabutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => IdeaHubHome()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.all(12),
          ),
          child: Text(
            'Idea Hub',
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
      ),
    );
    final investor = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InvestorHomePage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.all(12),
          ),
          child: Text(
            'Investor Hub',
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
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
              margin: EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  Text(
                    'Choose the purpose you are here for',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: <Widget>[
                      entrepreneur,
                      ideabutton,
                      investor,
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
