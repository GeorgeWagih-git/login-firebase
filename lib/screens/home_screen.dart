import 'package:flutter/material.dart';
import 'package:newproject/models/user_moadel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.usermodel});
  final UserModel usermodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              usermodel.name!,
              style: TextStyle(fontSize: 30, color: Colors.indigo),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Text(
              usermodel.email!,
              style: TextStyle(fontSize: 30, color: Colors.indigo),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Text(
              usermodel.phone!,
              style: TextStyle(fontSize: 30, color: Colors.indigo),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
