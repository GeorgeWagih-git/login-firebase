import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/profile_bloc/peofile_states.dart';
import 'package:newproject/blocs/profile_bloc/profile_bloc.dart';
import 'package:newproject/blocs/profile_bloc/profile_events.dart';
import 'package:newproject/variables.dart';
import 'package:newproject/widgets/app_drawer.dart';

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
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            drawer: state is ProfileLoadingState
                ? Center(child: CircularProgressIndicator())
                : state is ProfileSuccessState
                ? AppDrawer(
                    username: state.userModel.name ?? "Name not found",
                    userEmail: state.userModel.email ?? 'Email not found',
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
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcom Back !', style: TextStyle(fontSize: 40)),
                        Text(
                          state.userModel.name ?? "No Name Found...",
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
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
