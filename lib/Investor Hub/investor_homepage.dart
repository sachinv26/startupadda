import 'package:flutter/material.dart';

class InvestorHomePage extends StatefulWidget {
  const InvestorHomePage({Key? key}) : super(key: key);

  @override
  State<InvestorHomePage> createState() => _InvestorHomePageState();
}

class _InvestorHomePageState extends State<InvestorHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Investor Hub"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
    ),);
  }
}
