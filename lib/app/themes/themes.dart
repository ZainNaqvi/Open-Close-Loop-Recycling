import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Light - Theme

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.grey[200],
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark - Theme

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      color: Colors.grey[850],
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey[850],
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
