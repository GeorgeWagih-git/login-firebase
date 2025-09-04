abstract class AuthEvents {}

class LoginEvent extends AuthEvents {
  String email;
  String password;
  LoginEvent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvents {
  String email;
  String password;
  SignUpEvent({required this.email, required this.password});
}
