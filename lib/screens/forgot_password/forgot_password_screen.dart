import 'package:flutter/material.dart';
import 'package:fluttertemp/components/default_button.dart';
import 'package:fluttertemp/components/form_error.dart';
import 'package:fluttertemp/helpers/constants.dart';
import 'package:fluttertemp/screens/password_verified/password_verified_screen.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "ForgotPassword",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                ForgotPassForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(emailNullError)) {
                setState(() {
                  errors.remove(emailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(invalidEmailError)) {
                setState(() {
                  errors.remove(invalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(emailNullError)) {
                setState(() {
                  errors.add(emailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(invalidEmailError)) {
                setState(() {
                  errors.add(invalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
              title: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pushNamed(context, PassVerifiedScreen.routeName);
                }
              }),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              SizedBox(width: getProportionateScreenWidth(16)),
              Text("Sign Up",
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(16),
                      color: primaryColor))
            ],
          )
        ]));
  }
}
