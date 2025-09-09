import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.black,
    textColor: Colors.black,
    tileColor: Colors.white,
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
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
    textColor: Colors.white,
    tileColor: Color(0xFF1E1E1E),
  ),
);
