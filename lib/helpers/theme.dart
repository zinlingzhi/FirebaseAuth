import 'package:flutter/material.dart';
import 'package:fluttertemp/helpers/app_bar_theme.dart';
import 'package:fluttertemp/helpers/input_decoration_theme.dart';
import 'package:fluttertemp/helpers/text_theme.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}
