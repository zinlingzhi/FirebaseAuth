import 'package:flutter/material.dart';
import 'package:fluttertemp/helpers/constants.dart';
import 'package:fluttertemp/screens/sign_in/sign_in_screen.dart';
import 'package:fluttertemp/screens/sign_up/components/signup_form.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = "/sign_up";
  SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Text("Register", style: headingStyle),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SignupForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(16),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, SignInScreen.routeName),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
