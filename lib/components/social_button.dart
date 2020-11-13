import 'package:flutter/material.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class SocialButton extends StatelessWidget {
  final String image;
  final Function press;
  const SocialButton({Key key, this.image, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: getProportionateScreenHeight(56),
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                spreadRadius: 2,
                offset: Offset(0, 10)),
          ]),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/icons/google.png', width: 25),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  alignment: Alignment.center,
                  child: Text('Log in with Google',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ],
          )),
    );
  }
}
