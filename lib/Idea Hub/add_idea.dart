import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddIdea extends StatefulWidget {
  @override
  State<AddIdea> createState() => _AddIdeaState();
}

String? title;

class _AddIdeaState extends State<AddIdea> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
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
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController domainController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController reqController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    nameController.dispose();
    domainController.dispose();
    emailController.dispose();
    reqController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [



            TextField(
              controller: reqController,
              onChanged: (String value) {
                title = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                // hintText: 'Description',
                labelText: 'Requirements',
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
                labelText: 'email',
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
                labelText: 'Description',
                icon: Icon(Icons.description),
              ),
              maxLines: 3,
            ),
            const SizedBox(
              height: 10,
            ),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                icon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: domainController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Domain',
                icon: Icon(Icons.location_city),
              ),
            ),

            //   ShowAmenities(),
            AddIdea(),
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

                  register_property(
                      nameController.text,
                      descriptionController.text,
                      reqController.text,
                      domainController.text,
                      emailController.text);
                  emailController.clear();
                  nameController.clear();
                  descriptionController.clear();
                  domainController.clear();

                  setState(() {
                    _isLoading = false;
                  });
                  showSnackBar(context, 'Idea Added');
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

void register_property(
    String name,
    String description,
    String req,
    String domain,
    String email,
    ) async {
  await FirebaseFirestore.instance
      .collection('ideahub')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set({
    'description': description,
    'name':name,
    'req':req,
    'domain':domain,
    'email':email
  });
}