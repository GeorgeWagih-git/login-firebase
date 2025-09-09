import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_events.dart';
import 'package:newproject/blocs/login_bloc/login_states.dart';
import 'package:newproject/blocs/theme_bloc/theme_bloc.dart';
import 'package:newproject/blocs/theme_bloc/theme_event.dart';
import 'package:newproject/screens/login_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.username, required this.userEmail});
  final String username;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person, size: 50, color: Colors.purple),
                  SizedBox(width: 15),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(userEmail),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(Icons.brightness_medium_rounded),
                title: Text("Dark Theme"),
                trailing: BlocBuilder<ThemeBloc, bool>(
                  builder: (context, state) {
                    return Switch(
                      activeColor: Colors.blue,
                      value: state,
                      onChanged: (value) {
                        BlocProvider.of<ThemeBloc>(
                          context,
                        ).add(ChangeTheme(isDark: value));
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {},

                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                ),
              ),
              SizedBox(height: 15),
              BlocBuilder<LoginBloc, LoginAuthStates>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Are you sure you Want to logout ?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  BlocProvider.of<LoginBloc>(
                                    context,
                                  ).add(LogoutEvent());
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                child: Text('Ok'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: ListTile(
                      leading: Icon(Icons.logout, color: Colors.red),
                      title: Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
