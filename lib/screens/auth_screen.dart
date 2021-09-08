import 'package:flutter/material.dart';
import 'package:insta/screens/profile_screens.dart';
import 'package:insta/widgets/fade_stack.dart';
import 'package:insta/widgets/sign_in_form.dart';
import 'package:insta/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedForm = 1;

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              FadeStack(selectedForm: selectedForm),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 40,
                child: Container(
                    color: Colors.white,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (selectedForm == 0) {
                              selectedForm = 1;
                            } else {
                              selectedForm = 0;
                            }
                          });
                        },
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: (selectedForm == 0)
                                  ? "Already have an account? "
                                  : "Don't have an account? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                                text:
                                    (selectedForm == 0) ? "Log In" : "Sign Up",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ))),
              ),
            ],
          ),
        ));
  }
}
