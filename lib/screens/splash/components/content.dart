import 'package:flutter/material.dart';
import 'package:fluttertemp/helpers/constants.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class SplashContent extends StatelessWidget {
  final String text, image;
  const SplashContent({Key key, this.text, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("NAT SALES MAN",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(36),
                color: primaryColor,
                fontWeight: FontWeight.bold)),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
