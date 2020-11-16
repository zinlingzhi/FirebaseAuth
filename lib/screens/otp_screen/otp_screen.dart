import 'package:flutter/material.dart';
import 'package:fluttertemp/screens/otp_screen/components/otp_form.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = "/otp";
  OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    String phoneNumber = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Image.asset(
                  "assets/images/verify_code.png",
                  height: getProportionateScreenHeight(260),
                  width: getProportionateScreenWidth(259),
                ),
                Text(
                  "Enter the 4-digit code sent to \nyour phone number +1 808 600 ****",
                  textAlign: TextAlign.center,
                ),
                OtpForm(phoneNumber: phoneNumber),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                GestureDetector(
                  onTap: () {
                    // Resend your otp code...
                  },
                  child: Text(
                    "Resend OTP Code",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
