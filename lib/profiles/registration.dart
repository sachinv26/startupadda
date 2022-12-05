import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterProfile extends StatefulWidget {
  @override
  State<RegisterProfile> createState() => _RegisterProfileState();
}

String? title;

class _RegisterProfileState extends State<RegisterProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: UploadForm()),
    );
  }
}

class UploadForm extends StatefulWidget {
  UploadForm({Key? key}) : super(key: key);

  @override
  State<UploadForm> createState() => _UploadFormState();
}

String? chosenValue;
String? projectname;

class _UploadFormState extends State<UploadForm> {
  String dropdownvalue = 'Developers';

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

  final TextEditingController phController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  // final TextEditingController domainController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController lprofileController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    nameController.dispose();
    phController.dispose();
    emailController.dispose();
    lprofileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const Center(
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 35,
                  //   color: Colors.red,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            TextField(
              controller: nameController,
              onChanged: (String value) {
                title = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                // hintText: 'Description',
                labelText: 'Name',
                icon: Icon(Icons.title),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: phController,
              onChanged: (String value) {
                title = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                // hintText: 'Description',
                labelText: 'Phone No.',
                icon: Icon(Icons.title),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                // hintText: 'Description',
                labelText: 'Email',
                icon: Icon(Icons.real_estate_agent_sharp),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                // hintText: 'Description',
                labelText: ' Brief Description about yourself',
                icon: Icon(Icons.description),
              ),
              maxLines: 3,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: lprofileController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Linkedin Profile',
                icon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
                color: Colors.red,
                child: !_isLoading
                    ? Text(
                        'Add Idea',
                      )
                    : CircularProgressIndicator(
                        color: Colors.white,
                      ),
                onPressed: () async {
                  //showSnackBar(context);

                  setState(() {
                    _isLoading = true;
                  });

                  register_user(
                      dropdownvalue,
                      nameController.text,
                      phController.text,
                      descriptionController.text,
                      emailController.text,
                      lprofileController.text);
                  emailController.clear();
                  nameController.clear();
                  descriptionController.clear();
                  phController.clear();

                  setState(() {
                    _isLoading = false;
                  });
                  showSnackBar(context, 'Idea Added');

                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

void register_user(
  String category,
  String name,
  String ph,
  String email,
  String desc,
  String linkedin,
) async {
  await FirebaseFirestore.instance
      .collection(category)
        .add({
    'linkedin': linkedin,
    'name': name,
    'ph': ph,
    'desc': desc,
    'email': email
  });
}
