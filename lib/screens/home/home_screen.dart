import 'package:flutter/material.dart';
import 'package:fluttertemp/screens/home/components/user_info.dart';
import 'package:fluttertemp/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "\home";
  final String uid;
  HomeScreen({Key key, this.uid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();
  String uid;
  @override
  void initState() {
    super.initState();
    uid = widget.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("LogOut"),
            onPressed: () async {
              await _authService.signOut();
            },
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserInfo(uid: uid),
          ],
        ),
      ),
    );
  }
}
