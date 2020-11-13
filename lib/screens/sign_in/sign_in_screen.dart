import 'package:flutter/material.dart';
import 'package:fluttertemp/components/social_button.dart';
import 'package:fluttertemp/helpers/constants.dart';
import 'package:fluttertemp/screens/sign_in/components/signin_form.dart';
import 'package:fluttertemp/screens/sign_up/sign_up_screen.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenHeight * 0.08),
                        Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(28),
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.08),
                        SignInForm(),
                        SizedBox(height: SizeConfig.screenHeight * 0.03),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 24,
                                    thickness: 1,
                                  ),
                                ),
                              ),
                              Text(
                                "OR",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 24,
                                    thickness: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                        SocialButton(
                            image: "assets/icons/google.png", press: () {}),
                        SizedBox(height: SizeConfig.screenHeight * 0.08),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(16))),
                            SizedBox(width: getProportionateScreenWidth(16)),
                            GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, SignupScreen.routeName),
                                child: Text("Sign Up",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenHeight(16),
                                        color: primaryColor))),
                          ],
                        )
                      ],
                    ),
                  ))),
        ));
  }
}
