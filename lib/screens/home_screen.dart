import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_events.dart';
import 'package:newproject/blocs/login_bloc/login_states.dart';
import 'package:newproject/blocs/profile_bloc/peofile_states.dart';
import 'package:newproject/blocs/profile_bloc/profile_bloc.dart';
import 'package:newproject/blocs/profile_bloc/profile_events.dart';
import 'package:newproject/screens/login_screen.dart';
import 'package:newproject/variables.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: globalprofilebloc..add(GetUserProfile()),
      child: BlocBuilder<ProfileBloc, ProfileStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              centerTitle: true,
              backgroundColor: Colors.purple,
            ),
            drawer: state is ProfileLoadingState
                ? Center(child: CircularProgressIndicator())
                : state is ProfileSuccessState
                ? Drawer(
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
                                Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.purple,
                                ),
                                SizedBox(width: 15),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.userModel.name ??
                                          "No Name Found...",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    Text(
                                      state.userModel.email ??
                                          "No Email Found.....",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            BlocBuilder<LoginBloc, LoginAuthStates>(
                              builder: (context, state) {
                                return InkWell(
                                  onTap: () {
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
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15,
                                          ),
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
                  )
                : Center(
                    child: Text(
                      'Error',
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    ),
                  ),
            body: state is ProfileLoadingState
                ? Center(child: CircularProgressIndicator())
                : state is ProfileSuccessState
                ? Column(
                    children: [
                      Text('Welcom Back !', style: TextStyle(fontSize: 40)),
                      Text(
                        state.userModel.name ?? "No Name Found...",
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      'Error',
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
