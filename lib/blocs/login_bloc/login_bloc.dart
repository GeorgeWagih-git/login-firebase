import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_events.dart';
import 'package:newproject/blocs/login_bloc/login_states.dart';

class LoginBloc extends Bloc<AuthEvents, LoginAuthStates> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signuppassword = TextEditingController();
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
        print(
          '📩 Email :  ${userCredential.user?.email}\n User Id : ${userCredential.user?.uid}',
        );
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
      } on FirebaseAuthException catch (error) {
        emit(SignUPFail(error.message!));
      }
    });
  }
}
