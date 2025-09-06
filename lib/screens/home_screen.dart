import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/profile_bloc/peofile_states.dart';
import 'package:newproject/blocs/profile_bloc/profile_bloc.dart';
import 'package:newproject/blocs/profile_bloc/profile_events.dart';
import 'package:newproject/variables.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userID});
  final String userID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: globalprofilebloc..add(GetUserProfile(uid: userID)),
      child: BlocBuilder<ProfileBloc, ProfileStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              centerTitle: true,
              backgroundColor: Colors.purple,
            ),
            drawer: Drawer(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person, size: 50, color: Colors.purple),
                    SizedBox(width: 15),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state is ProfileSuccessState
                            ? Text(
                                state.userModel.name ?? "No Name Found...",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                "Loading",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        state is ProfileSuccessState
                            ? Text(
                                state.userModel.email ?? "No Email Found.....",
                              )
                            : Text("Loading....."),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
