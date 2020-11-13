import 'package:flutter/material.dart';
import 'package:fluttertemp/helpers/size_config.dart';

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
