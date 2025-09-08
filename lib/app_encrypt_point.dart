import 'package:flutter/material.dart';
import 'package:newproject/main.dart';
import 'package:newproject/screens/home_screen.dart';
import 'package:newproject/screens/login_screen.dart';

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: checkUID(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          if (snapshot.data != null) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        }
      },
    );
  }
}
