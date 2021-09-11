import 'package:flutter/material.dart';
import 'package:insta/constants/matarial_white.dart';
import 'package:insta/home_page.dart';
import 'package:insta/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AuthScreen(),
      home: HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
