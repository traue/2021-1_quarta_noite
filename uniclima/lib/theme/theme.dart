import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey[800],
      appBarTheme: AppBarTheme(color: Colors.grey[600]),
      textTheme: TextTheme(
        headline4: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w200),
      ));
}

ThemeData lightTheme() {
  return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(color: Colors.deepPurple[700]),
      textTheme: TextTheme(
        headline4: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w200),
      ));
}
