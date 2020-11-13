import 'package:flutter/material.dart';
import 'package:fluttertemp/helpers/constants.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function press;
  const DefaultButton({Key key, this.title, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: press,
        child: Text(title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            )),
        color: primaryColor,
      ),
    );
  }
}
