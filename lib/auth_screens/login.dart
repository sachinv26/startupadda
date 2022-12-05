import 'package:flutter/material.dart';
import 'package:startupadda/auth_screens//signup.dart';
import 'package:startupadda/auth_screens/auth_methods.dart';
import 'package:startupadda/widgets/text_input_field.dart';
import 'package:startupadda/categorypage.dart';

class IdeaHubLoginScreen extends StatefulWidget {
  const IdeaHubLoginScreen({Key? key}) : super(key: key);

  @override
  _IdeaHubLoginScreenState createState() => _IdeaHubLoginScreenState();
}

class _IdeaHubLoginScreenState extends State<IdeaHubLoginScreen> {
  final buttonColor = Colors.red;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Category()),
      );

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
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
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 45),
                TextInputField(
                  labelText: 'enter your email',
                  controller: _emailController,
                  icon: Icons.mail_rounded,
                ),
                const SizedBox(
                  height: 24,
                ),
                passFieldInput(
                  hintText: 'Enter your password ',
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: loginUser,
                  child: Container(
                    child: !_isLoading
                        ? const Text(
                      'Log in',
                    )
                        : const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: buttonColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        'Dont have an account?',
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => IdeaHubSignupScreen(),
                        ),
                      ),
                      child:  Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child:  const Text(
                          ' Signup.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
