abstract class AuthStates {}

class LoginInitState extends AuthStates {}

class LoginSuccess extends AuthStates {}

class LoginLoading extends AuthStates {}

class LoginFail extends AuthStates {
  String error;
  LoginFail(this.error);
}

class SignUPSuccess extends AuthStates {}

class SignUPLoading extends AuthStates {}

class SignUPFail extends AuthStates {
  String error;
  SignUPFail(this.error);
}
