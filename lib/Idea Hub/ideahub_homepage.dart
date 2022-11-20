import 'package:flutter/material.dart';
import 'package:startupadda/auth_screens/auth_methods.dart';



class IdeaHubHome extends StatefulWidget {
  const IdeaHubHome({Key? key}) : super(key: key);

  @override
  State<IdeaHubHome> createState() => _IdeaHubHomeState();
}

class _IdeaHubHomeState extends State<IdeaHubHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Idea Hub Home'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              AuthMethods().signOut(context);

            }, child: Text('signout'))


          ],
        )
        ),

    );
  }
}
