import 'package:flutter/material.dart';
import 'package:fluttertemp/components/default_button.dart';
import 'package:fluttertemp/screens/splash/splash_screen.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class PassVerifiedScreen extends StatefulWidget {
  static String routeName = "/pass_verified";
  PassVerifiedScreen({Key key}) : super(key: key);

  @override
  _PassVerifiedScreenState createState() => _PassVerifiedScreenState();
}

class _PassVerifiedScreenState extends State<PassVerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  width: SizeConfig.screenWidth,
                  alignment: Alignment.center,
                  child: Text("Password Verified Screen",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold))),
              Positioned(
                  bottom: 80,
                  child: SizedBox(
                      child: DefaultButton(
                          title: "Back to Login",
                          press: () {
                            Navigator.pushNamed(
                                context, SplashScreen.routeName);
                          }),
                      width: SizeConfig.screenWidth * 0.6))
            ],
          )),
    );
  }
}
