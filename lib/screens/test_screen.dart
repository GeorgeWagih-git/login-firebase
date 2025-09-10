import 'package:flutter/material.dart';
import 'package:newproject/widgets/app_drawer.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test'), centerTitle: true),
      drawer: AppDrawer(username: 'Test', userEmail: 'Test@mail.com'),
    );
  }
}
