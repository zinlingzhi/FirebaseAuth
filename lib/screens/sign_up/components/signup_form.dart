import 'package:flutter/material.dart';
import 'package:fluttertemp/components/custom_suffix.dart';
import 'package:fluttertemp/components/default_button.dart';
import 'package:fluttertemp/components/form_error.dart';
import 'package:fluttertemp/helpers/constants.dart';
import 'package:fluttertemp/screens/complete_profile/complete_profile_screen.dart';
import 'package:fluttertemp/services/auth_service.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
  final List<String> errors = [];

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPassFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            title: "Sign Up",
            press: () async {
              if (_formKey.currentState.validate()) {
                // Go to Complete Profile Page...
                _formKey.currentState.save();
                dynamic user = await _authService.registerWithEmailAndPassword(
                    email, password);
                if (user == null) {
                  errors.add("Please try again to keep");
                  _formKey.currentState.save();
                } else if (user == 'weak') {
                  errors.add('Please type a stronger password');
                  _formKey.currentState.save();
                } else if (user == 'duplicate') {
                  if (!errors.contains(emailAlreadyExist)) {
                    errors.add(emailAlreadyExist);
                  }
                  _formKey.currentState.save();
                  _formKey.currentState.validate();
                } else {
                  print(user);
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName,
                      arguments: user.uid);
                }
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
        email = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(emailNullError)) {
          setState(() {
            errors.add(emailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(invalidEmailError)) {
          setState(() {
            errors.add(invalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
      ),
    );
  }

  TextFormField buildPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isEmpty && errors.contains(passNullError)) {
          setState(() {
            errors.remove(passNullError);
          });
        } else if (value.length >= 8 && errors.contains(shortPassError)) {
          setState(() {
            errors.remove(shortPassError);
          });
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(passNullError)) {
          setState(() {
            errors.add(passNullError);
          });
          return "";
        } else if (value.length < 8 && !errors.contains(shortPassError)) {
          setState(() {
            errors.add(shortPassError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: CustomSuffixIcon(image: "assets/icons/view.png")),
    );
  }

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (password == confirmPassword) {
          setState(() {
            errors.remove(matchPassError);
          });
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != value) {
          setState(() {
            errors.add(matchPassError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          suffixIcon: CustomSuffixIcon(image: "assets/icons/view.png")),
    );
  }
}
