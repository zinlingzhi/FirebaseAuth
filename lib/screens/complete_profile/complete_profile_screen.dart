import 'package:flutter/material.dart';
import 'package:fluttertemp/helpers/constants.dart';
import 'package:fluttertemp/screens/complete_profile/components/complete_profile_form.dart';
import 'package:fluttertemp/helpers/size_config.dart';

class CompleteProfileScreen extends StatefulWidget {
  static String routeName = "/complete_profile";
  CompleteProfileScreen({Key key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final String uid = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Complete Profile",
                style: headingStyle,
              ),
              Expanded(
                child: CompleteProfileForm(uid: uid),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
