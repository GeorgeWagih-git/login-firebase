import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/profile_bloc/peofile_states.dart';
import 'package:newproject/blocs/profile_bloc/profile_events.dart';
import 'package:newproject/models/user_moadel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBloc extends Bloc<GetUserProfile, ProfileStates> {
  ProfileBloc() : super(ProfileInitState()) {
    on<GetUserProfile>((event, emit) async {
      try {
        emit(ProfileLoadingState());
        var shared = await SharedPreferences.getInstance();
        String? uid = shared.getString('uid');
        print("🖨️ UserId : ${uid} ");
        var userData = await FirebaseFirestore.instance
            .collection('Users_id')
            .doc(uid)
            .get();
        UserModel userModel = UserModel.fromMap(userData.data() ?? {});

        print("🖨️ Map of userDATA : ${userData.data()} ");
        emit(ProfileSuccessState(userModel: userModel));
      } on FirebaseAuthException catch (error) {
        emit(ProfileFailState(error: error.message!));
      }
    });
  }
}
