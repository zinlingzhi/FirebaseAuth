import 'package:flutter/material.dart';
import 'package:fluttertemp/bootwrapper.dart';
import 'package:fluttertemp/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertemp/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'helpers/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: theme(),
        initialRoute: Bootwrapper.routeName,
        routes: routes,
      ),
    );
  }
}
