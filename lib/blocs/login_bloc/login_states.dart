abstract class LoginAuthStates {}

class LoginInitState extends LoginAuthStates {}

class LoginSuccess extends LoginAuthStates {}

class LoginLoading extends LoginAuthStates {}

class LoginFail extends LoginAuthStates {
  String error;
  LoginFail(this.error);
}

class LogoutSuccess extends LoginAuthStates {}

class LogoutLoading extends LoginAuthStates {}

class LogoutFail extends LoginAuthStates {
  String error;
  LogoutFail(this.error);
}

class SignUPSuccess extends LoginAuthStates {}

class SignUPLoading extends LoginAuthStates {}

class SignUPFail extends LoginAuthStates {
  String error;
  SignUPFail(this.error);
}
