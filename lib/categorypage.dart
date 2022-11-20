import 'package:flutter/material.dart';
import './auth_screens/login_register_query.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entrepreneur = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 150,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginRegisterPage()));
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
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ),
      ),
    );
    final ideabutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 150,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginRegisterPage()));
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
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ),
      ),
    );
    final investor = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 150,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginRegisterPage()));
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
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 200),
            child: Column(
              children: [
                Text('Choose the purpose you are here for'),
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
        backgroundColor: Colors.white,
      ),
    );
  }
}
