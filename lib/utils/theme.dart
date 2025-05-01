import 'package:flutter/material.dart';

class SwiftBankTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.red,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      color: Colors.redAccent,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.redAccent,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}
