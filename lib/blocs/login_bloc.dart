import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/login_events.dart';
import 'package:newproject/blocs/login_states.dart';

class LoginBloc extends Bloc<AuthEvents, AuthStates> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signuppassword = TextEditingController();
  LoginBloc() : super(LoginInitState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        print('🖨️ login succeeded 👌');
        emit(LoginSuccess());
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
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(SignUPSuccess());
        print('🖨️ SignUp successed 👌');
      } on FirebaseAuthException catch (error) {
        emit(SignUPFail(error.message!));
      }
    });
  }
}
