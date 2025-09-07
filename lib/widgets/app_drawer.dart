import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_events.dart';
import 'package:newproject/blocs/login_bloc/login_states.dart';
import 'package:newproject/screens/login_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.username, required this.userEmail});
  final String username;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20),
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
              BlocBuilder<LoginBloc, LoginAuthStates>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.red),
                          SizedBox(width: 15),
                          Text(
                            "LogOut",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ],
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
