import 'package:newproject/models/user_moadel.dart';

abstract class ProfileStates {}

class ProfileInitState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  UserModel userModel;
  ProfileSuccessState({required this.userModel});
}

class ProfileFailState extends ProfileStates {
  String error;
  ProfileFailState({required this.error});
}
