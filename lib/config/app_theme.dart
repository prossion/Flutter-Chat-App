import 'package:flutter/material.dart';

const picturePhoto = Color.fromRGBO(116, 116, 128, 1);
const blackTextStyle = Colors.black;
const whiteTextStyle = Colors.white;
const blueAccentTextStyle = Colors.blueAccent;
const greenTextStyle = Colors.green;
const greyTextStyle = Colors.grey;

enum AppTheme { light, dark }

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    cardColor: Colors.white,
    bottomAppBarColor: Colors.grey.shade700,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 23),
      foregroundColor: Colors.white,
    ),
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey,
    cardColor: Colors.grey,
    backgroundColor: Colors.white,
    bottomAppBarColor: Colors.white,
    // dividerColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 23),
    ),
  );
}
