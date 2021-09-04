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
  int selectedForm = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          FadeStack(selectedForm: selectedForm),
          Container(
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (selectedForm == 0) {
                        selectedForm = 1;
                      } else {
                        selectedForm = 0;
                      }
                    });
                  },
                  child: Text('Go to sign up'))),
        ],
      ),
    ));
  }
}
