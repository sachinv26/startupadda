import 'package:flutter/material.dart';
import 'package:startupadda/profiles/profile_page.dart';


class TeamHome extends StatefulWidget {
  const TeamHome({Key? key}) : super(key: key);

  @override
  State<TeamHome> createState() => _TeamHomeState();
}

class _TeamHomeState extends State<TeamHome> {



  var items = [
    'Developers',
    'Consultants',
    'Managers',
    'Electricians',
    'Chefs',
    'HR',
    'Designer',
    'Teachers'
  ];
  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(items[index]),
                        ),
                      );
                    },
                    child: ListTile(
                        leading: const Icon(Icons.arrow_forward_ios),
                        title: Text(
                          items[index],
                        )),
                  );
                })),
      ),
    );
  }
}
