import 'package:flutter/material.dart';
import 'package:fluttertemp/helpers/size_config.dart';

const primaryColor = Color(0xFFEF5350);
const primaryLightColor = Color(0xFFFFECDF);
const primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF8A80), Color(0xFFEF9A9A)]);
const secondColor = Color(0xFF979797);
const textColor = Color(0xFF757575);

const animationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  color: Colors.black,
  fontWeight: FontWeight.bold,
  height: 1.5,
);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please Enter your email";
const String invalidEmailError = "Please Enter Valid Email";
const String passNullError = "Please Enter your password";
const String shortPassError = "Password is too short";
const String matchPassError = "Passwords don't match";
const String companyNullError = "Please Enter Company Name";
const String ownerNullError = "Please Enter Owner Name";
const String latitudeNullError = "Please Enter Latitude";
const String longitudeNullError = "Please Enter Longitude";
const String townCityNullError = "Please Enter City Name";
const String pinCodeNullError = "Please Enter Pin Code";
const String emailAlreadyExist = "Your Email is already exist";
const String accountNullError = "Your account is not exist";
const String completeProfileError = "Try again to complete Profile";
const String phoneNumberNullError = "Please Enter Phone Number";
