import 'package:flutter/material.dart';
import 'package:startupadda/auth_screens//signup.dart';
import 'package:startupadda/auth_screens/login.dart';
class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    // registration button widget
    final registerbutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 150,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IdeaHubSignupScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.all(12),
          ),
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ),
      ),
    );

    final loginbutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 40,
        width: 150,
        child: OutlinedButton(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.brown, fontSize: 12.0),
          ),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => IdeaHubLoginScreen()));
          },
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
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
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/Startup1.png"),
                            fit: BoxFit.scaleDown),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(right: 10.0, left: 10.0),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[loginbutton, registerbutton],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
