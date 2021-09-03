import 'package:flutter/material.dart';
import 'package:insta/constants/common_size.dart';
import 'package:insta/constants/screen_size.dart';
import 'package:insta/widgets/profile_body.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final duration = Duration(milliseconds: 300);
  final menuWidth = size.width / 2;

  MenuStatus _menuStatus = MenuStatus.closed;
  double bodyXPos = 0;
  double menuXPos = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            AnimatedContainer(
              duration: duration,
              curve: Curves.fastOutSlowIn,
              child: ProfileBody(onMenuChanged: () {
                setState(() {
                  _menuStatus = (_menuStatus == MenuStatus.closed)
                      ? MenuStatus.open
                      : MenuStatus.closed;
                  switch (_menuStatus) {
                    case MenuStatus.open:
                      bodyXPos = -menuWidth;
                      menuXPos = size.width - menuWidth;
                      break;
                    case MenuStatus.closed:
                      bodyXPos = 0;
                      menuXPos = size.width;
                      break;
                  }
                });
              }),
              transform: Matrix4.translationValues(bodyXPos, 0, 0),
            ),
            AnimatedContainer(
              duration: duration,
              curve: Curves.fastOutSlowIn,
              transform: Matrix4.translationValues(menuXPos, 0, 0),
              child: Container(color: Colors.deepPurpleAccent),
            ),
          ],
        ));
  }
}

enum MenuStatus { open, closed }
