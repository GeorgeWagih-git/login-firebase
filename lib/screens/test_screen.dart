import 'package:flutter/material.dart';
import 'package:newproject/widgets/app_drawer.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ],
      ),
      drawer: AppDrawer(username: 'Test', userEmail: 'Test@mail.com'),
    );
  }
}
