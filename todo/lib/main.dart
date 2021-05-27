import 'package:flutter/material.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/theme/theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "ToDo List",
    home: Home(),
    themeMode: ThemeMode.system,
    theme: lightTheme(),
    darkTheme: darkTheme(),
  ));
}