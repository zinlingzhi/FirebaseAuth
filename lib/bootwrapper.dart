import 'package:flutter/material.dart';
import 'package:fluttertemp/screens/home/home_screen.dart';
import 'package:fluttertemp/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Bootwrapper extends StatelessWidget {
  static String routeName = "/bootwrapper";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return SplashScreen();
    } else {
      return HomeScreen();
    }
  }
}
