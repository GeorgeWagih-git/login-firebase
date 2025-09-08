import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/app_encrypt_point.dart';
import 'package:newproject/blocs/login_bloc/login_bloc.dart';
import 'package:newproject/blocs/profile_bloc/profile_events.dart';
import 'package:newproject/blocs/theme_bloc/theme_bloc.dart';
import 'package:newproject/blocs/theme_bloc/theme_event.dart';
import 'package:newproject/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("📥 Messege arrived while app is closed");
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getToken().then((value) {
    print("🖨️ My FCM token is : $value");
  });
  FirebaseMessaging.onMessage.listen(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessageOpenedApp.listen(
    _firebaseMessagingBackgroundHandler,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  globalprofilebloc.add(GetUserProfile());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ThemeBloc()..add(InitTheme())),
      ],
      child: MyApp(),
    ),
  );
}

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeAnimationCurve: Curves.fastOutSlowIn,
      themeAnimationDuration: Duration(milliseconds: 1500),
      debugShowCheckedModeBanner: false,
      themeMode: context.select(
        (ThemeBloc bloc) => bloc.state ? ThemeMode.light : ThemeMode.dark,
      ),
      home: AppEntryPoint(),
    );
  }
}
