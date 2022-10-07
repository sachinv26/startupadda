import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pandabar/pandabar.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

class MyhomePage extends StatefulWidget {
  const MyhomePage({Key? key}) : super(key: key);
  @override
  State<MyhomePage> createState() => _MyhomePageState();
}
class _MyhomePageState extends State<MyhomePage> {
  TextEditingController textController = TextEditingController();
  int Counter = 0;
  String IsOpened = "No";
  String BtnText = "OpenMenu";
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('StartupADDA'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            searchBarUI(),
            SingleChildScrollView(
              
            )
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
            fabOpenIcon: Icon(Icons.menu, color: Colors.white),
            fabCloseIcon: Icon(Icons.close, color: Colors.red),
            fabMargin: const EdgeInsets.all(20.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.easeInOutCirc,
            onDisplayChange: (isOpen) {
              if (isOpen) {
                setState(() {
                  IsOpened = "Yes";
                });
              } else {
                setState(() {
                  IsOpened = "No";
                });
              }
            },
            children: [
              FloatingActionButton(
                heroTag: "FAB_Plus_1",
                child: Icon(Icons.plus_one),
                onPressed: () {
                  setState(() {
                    Counter = Counter + 1;
                  });
                },
              ),
              FloatingActionButton(
                heroTag: "FAB_Plus_1",
                child: Icon(Icons.plus_one),
                onPressed: () {
                  setState(() {
                    Counter = Counter + 1;
                  });
                },
              ),
              FloatingActionButton(
                heroTag: "FAB_Plus_1",
                child: Icon(Icons.plus_one),
                onPressed: () {
                  setState(() {
                    Counter = Counter + 1;
                  });
                },
              ),
              FloatingActionButton(
                heroTag: "FAB_Plus_1",
                child: Icon(Icons.plus_one),
                onPressed: () {
                  setState(() {
                    Counter = Counter + 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBarUI(){

    return FloatingSearchBar(
      hint: 'Search.....',
      openAxisAlignment: 0.0,
      openWidth: 600,
      axisAlignment:0.0,
      scrollPadding: EdgeInsets.only(top: 16,bottom: 20),
      elevation: 4.0,
      physics: BouncingScrollPhysics(),
      onQueryChanged: (query){
        //Your methods will be here
      },
      transitionCurve: Curves.easeInOut,
      transitionDuration: Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      debounceDelay: Duration(milliseconds: 500),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(icon: Icon(Icons.place),
            onPressed: (){
              print('Places Pressed');
            },),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition){
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Material(
            color: Colors.white,
            child: Container(
              height: 200.0,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Home'),
                    subtitle: Text('more info here........'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
