import 'package:flutter/material.dart';
import 'package:fluttertemp/bootwrapper.dart';
import 'package:fluttertemp/screens/complete_profile/complete_profile_screen.dart';
import 'package:fluttertemp/screens/forgot_password/forgot_password_screen.dart';
import 'package:fluttertemp/screens/home/home_screen.dart';
import 'package:fluttertemp/screens/otp_screen/otp_screen.dart';
import 'package:fluttertemp/screens/password_verified/password_verified_screen.dart';
import 'package:fluttertemp/screens/sign_in/sign_in_screen.dart';
import 'package:fluttertemp/screens/sign_up/sign_up_screen.dart';
import 'package:fluttertemp/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  PassVerifiedScreen.routeName: (context) => PassVerifiedScreen(),
  SignupScreen.routeName: (context) => SignupScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  Bootwrapper.routeName: (context) => Bootwrapper()
};
