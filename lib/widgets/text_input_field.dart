import 'package:flutter/material.dart';


class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  const TextInputField(
      {Key? key,
        required this.controller,
        required this.labelText,

        required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue,
            )),
      ),

    );
  }
}


class SemInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  final IconData icon;

  const SemInputField(
      {Key? key,
        required this.controller,
        required this.labelText,

        required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 1,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue,
            )),
      ),

    );
  }
}




class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;

  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,

    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextField(

      textAlign: TextAlign.center,
      maxLength: 7,
      controller: textEditingController,
      decoration:  InputDecoration(
        labelText: 'enter your eno',
        prefixIcon: Icon(Icons.school),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue,
            )),
      ),

      keyboardType: textInputType,
      obscureText: false,
    );
  }
}



class passFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  const passFieldInput({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextField(
      // maxLength: 7,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: "enter your  password",
        prefixIcon: Icon(Icons.security),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue,
            )),
      ),
      keyboardType: textInputType,
      obscureText: true,
    );
  }
}