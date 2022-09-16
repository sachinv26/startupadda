import 'package:flutter/material.dart';
import 'package:pandabar/pandabar.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

class MyhomePage extends StatefulWidget {
  const MyhomePage({Key? key}) : super(key: key);

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  int Counter = 0;
  String IsOpened="No";
  String BtnText ="OpenMenu";
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "$Counter",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) => FabCircularMenu(
              key: fabKey,
              alignment: Alignment.bottomCenter,
              ringColor: Colors.teal,
              ringDiameter: 455.0,
              ringWidth: 80.0,
              fabSize: 50.0,
              fabElevation: 8.0,
              fabColor: Colors.green,
              fabOpenIcon: Icon(Icons.menu, color:Colors.white),
              fabCloseIcon: Icon(Icons.close, color:Colors.red),
              fabMargin: const EdgeInsets.all(20.0),
              animationDuration: const Duration(milliseconds: 800),
              animationCurve: Curves.easeInOutCirc,
              onDisplayChange: (isOpen) {
                if(isOpen){
                  setState(() {
                    IsOpened="Yes";
                  });
                }
                else{
                  setState(() {
                    IsOpened="No";
                  });
                }
              },
              children: [
                FloatingActionButton(
                  heroTag:"FAB_Plus_1",
                  child:Icon(Icons.plus_one),
                  onPressed:(){
                    setState(() {
                      Counter=Counter+1;
                    });
                  },
                ),
                FloatingActionButton(
                  heroTag:"FAB_Plus_1",
                  child:Icon(Icons.plus_one),
                  onPressed:(){
                    setState(() {
                      Counter=Counter+1;
                    });
                  },
                ),
                FloatingActionButton(
                  heroTag:"FAB_Plus_1",
                  child:Icon(Icons.plus_one),
                  onPressed:(){
                    setState(() {
                      Counter=Counter+1;
                    });
                  },
                ),
                FloatingActionButton(
                  heroTag:"FAB_Plus_1",
                  child:Icon(Icons.plus_one),
                  onPressed:(){
                    setState(() {
                      Counter=Counter+1;
                    });
                  },
                ),
              ],
          ),
        ),
      ),
    );
  }
}
