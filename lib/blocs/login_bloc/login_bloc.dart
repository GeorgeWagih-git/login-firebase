import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_events.dart';
import 'package:newproject/blocs/login_bloc/login_states.dart';
import 'package:newproject/models/user_moadel.dart';

class LoginBloc extends Bloc<AuthEvents, LoginAuthStates> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signupname = TextEditingController();
  TextEditingController signuppassword = TextEditingController();
  TextEditingController signupphoneNumber = TextEditingController();
  final loginformKey = GlobalKey<FormState>();
  final signupformKey = GlobalKey<FormState>();

  LoginBloc() : super(LoginInitState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: event.email,
              password: event.password,
            );
        final uid = userCredential.user?.uid;
        emit(LoginSuccess(uid: uid!));
      } on FirebaseAuthException catch (error) {
        if (error.code == 'invalid-credential') {
          emit(LoginFail('Incorrect email or password. Please try again.'));
        } else {
          emit(LoginFail(error.message!));
        }
      }
    });

    on<SignUpEvent>((event, emit) async {
      try {
        emit(SignUPLoading());
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: event.email,
              password: event.password,
            );
        UserModel userModel = UserModel(
          email: userCredential.user?.email,
          name: event.name ?? "no name",
          phone: event.phone ?? "no number",
        );
        print('🖨️ Map : ${userModel.toMap()}');
        emit(SignUPSuccess());
        await FirebaseFirestore.instance
            .collection('Users_id')
            .doc(userCredential.user?.uid)
            .set(userModel.toMap());
      } on FirebaseAuthException catch (error) {
        emit(SignUPFail(error.message!));
      }
    });
  }
}
