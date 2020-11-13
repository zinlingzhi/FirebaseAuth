import 'package:flutter/material.dart';
import 'package:fluttertemp/components/default_button.dart';
import 'package:fluttertemp/components/form_error.dart';
import 'package:fluttertemp/helpers/constants.dart';
import 'package:fluttertemp/screens/forgot_password/forgot_password_screen.dart';
import 'package:fluttertemp/screens/home/home_screen.dart';
import 'package:fluttertemp/services/auth_service.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool rememberMe = false;

  final List<String> errors = [];
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          FormError(errors: errors),
          Row(
            children: [
              Checkbox(
                  value: rememberMe,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  }),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text("Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline)),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            title: "Sign In",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                dynamic result = await _authService.signInWithEmailAndPassword(
                    email, password);
                if (result != null) {
                  Navigator.pushNamed(context, HomeScreen.routeName,
                      arguments: result.uid);
                } else {
                  if (!errors.contains(accountNullError))
                    errors.add(accountNullError);
                  _formKey.currentState.validate();
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
        if (value.isNotEmpty && errors.contains(emailNullError)) {
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(passNullError)) {
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
        suffixIcon: CustomSuffixIcon(image: "assets/icons/view.png"),
      ),
    );
  }
}

class CustomSuffixIcon extends StatelessWidget {
  final String image;
  const CustomSuffixIcon({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
          getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
      child: Image.asset(
        image,
        width: getProportionateScreenWidth(12),
      ),
    );
  }
}
