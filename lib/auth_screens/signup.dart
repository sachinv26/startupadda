import 'package:flutter/material.dart';
import 'package:startupadda/Idea%20Hub/ideahub_homepage.dart';
import 'package:startupadda/auth_screens/auth_methods.dart';
import 'package:startupadda/widgets/text_input_field.dart';
class IdeaHubSignupScreen extends StatefulWidget {
  const IdeaHubSignupScreen({Key? key}) : super(key: key);

  @override
  State<IdeaHubSignupScreen> createState() => _IdeaHubSignupScreenState();
}

class _IdeaHubSignupScreenState extends State<IdeaHubSignupScreen> {
  final TextEditingController _name= TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController =TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().teacher_signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        name:_name.text,

    );
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => IdeaHubHome()),


      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                const Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 45),
                TextInputField(controller: _name, labelText: 'enter your good name', icon: Icons.person,  ),

                const SizedBox(
                  height: 24,
                ),
                TextInputField(
                  labelText: 'enter your email',
                  controller: _emailController,
                  icon: Icons.mail_rounded,
                ),
                const SizedBox(
                  height: 24,
                ),
                passFieldInput(
                  hintText: 'enter your password buddy',
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,

                ),
                const SizedBox(
                  height: 24,
                ),

                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: signUpUser,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: Colors.blue,
                    ),
                    child: !_isLoading
                        ? const Text(
                      'Sign up',
                    )
                        : const CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        'Already have an account?',
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        child: const Text(
                          ' Login.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
