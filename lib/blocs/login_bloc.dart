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
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          )
          .then((value) {
            print('🖨️ login successed 👌');
            emit(LoginSuccess());
          })
          .catchError((error) {
            print('🖨️ login failed because : ${error.toString()}');
            emit(LoginFail(error.toString()));
          });
    });
    on<SignUpEvent>((event, emit) async {
      emit(SignUPLoading());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          )
          .then((value) {
            emit(SignUPSuccess());
            print('🖨️ SignUp successed 👌');
          })
          .catchError((error) {
            emit(SignUPFail(error.toString()));
            print('🖨️ SignUp failed because : ${error.toString()}');
          });
    });
  }
}
