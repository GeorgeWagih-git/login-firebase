import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
  listTileTheme: ListTileThemeData(
    iconColor: Colors.black,
    textColor: Colors.black,
    tileColor: Color(0xffF7F5EE),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.blue,
  ),
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
  listTileTheme: ListTileThemeData(
    iconColor: Colors.white,
    textColor: Colors.white,
    tileColor: Color(0xFF1E1E1E),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
);
