import 'package:flutter/material.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class FormError extends StatelessWidget {
  final List<String> errors;
  const FormError({Key key, @required this.errors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({String error}) {
    return Row(children: [
      Image.asset(
        "assets/icons/error.png",
        height: getProportionateScreenWidth(14),
        width: getProportionateScreenWidth(14),
      ),
      SizedBox(width: getProportionateScreenWidth(10)),
      Text(error)
    ]);
  }
}
