import 'package:flutter/material.dart';
import 'package:pandabar/pandabar.dart';

class MyhomePage extends StatefulWidget {
  const MyhomePage({Key? key}) : super(key: key);

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  String page = 'Grey';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appbar can  be edited here
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Startup Adda",
            style: TextStyle(fontSize: 22),
          ),
          leading: Icon(Icons.back_hand),
        ),
        // cureved navigation bar
        bottomNavigationBar: PandaBar(
          buttonData: [
            PandaBarButtonData(
                id: 'Grey',
                icon: Icons.dashboard,
                title: 'Grey'
            ),
            PandaBarButtonData(
                id: 'Blue',
                icon: Icons.book,
                title: 'Blue'
            ),
            PandaBarButtonData(
                id: 'Red',
                icon: Icons.account_balance_wallet,
                title: 'Red'
            ),
            PandaBarButtonData(
                id: 'Yellow',
                icon: Icons.notifications,
                title: 'Yellow'
            ),
          ],
          onChange: (id) {
            setState(() {
              page = id;
            });
          },
          onFabButtonPressed: () {

          },
        ),
        // //floatingActionButton: FloatingActionButton(
        //   elevation: 10.0,
        //   child: const Icon(Icons.add),
        //   onPressed: () {
        //     // action on button press
        //   },
        // ),
        body: Builder(
          builder: (context) {
            switch (page) {
              case 'Grey':
                return Container(child: Center(child: Text("PAGE 1")));
              case 'Blue':
                return Container(child: Center(child: Text("PAGE 2")));
              case 'Red':
                return Container(child: Center(child: Text("PAGE 3")));
              case 'Yellow':
                return Container(child: Center(child: Text("PAGE 4")));
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
