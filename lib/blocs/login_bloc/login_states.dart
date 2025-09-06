abstract class LoginAuthStates {}

class LoginInitState extends LoginAuthStates {}

class LoginSuccess extends LoginAuthStates {
  String uid;
  LoginSuccess({required this.uid});
}

class LoginLoading extends LoginAuthStates {}

class LoginFail extends LoginAuthStates {
  String error;
  LoginFail(this.error);
}

class SignUPSuccess extends LoginAuthStates {}

class SignUPLoading extends LoginAuthStates {}

class SignUPFail extends LoginAuthStates {
  String error;
  SignUPFail(this.error);
}
