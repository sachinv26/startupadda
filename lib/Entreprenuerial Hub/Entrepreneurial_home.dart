import 'package:flutter/material.dart';


class EntrepreneurHomePage extends StatefulWidget {
  const EntrepreneurHomePage({Key? key}) : super(key: key);

  @override
  State<EntrepreneurHomePage> createState() => _EntrepreneurHomePageState();
}

class _EntrepreneurHomePageState extends State<EntrepreneurHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Entreprenuerial Hub'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    ),);
  }
}
