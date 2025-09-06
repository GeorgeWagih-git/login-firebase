import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_bloc.dart';
import 'package:newproject/screens/home_screen.dart';
import 'package:newproject/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getToken().then((value) {
    print("🖨️ My FCM token is : $value");
  });
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LoginBloc())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String?> checkUID() async {
    var shared = await SharedPreferences.getInstance();
    String? uid = shared.getString('uid');
    if (uid != null) {
      print("🖨️ UserId : $uid");
      return uid;
    } else {
      print("🖨️ no user id stored");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String?>(
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
      ),
    );
  }
}
