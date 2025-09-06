abstract class AuthEvents {}

class LoginEvent extends AuthEvents {
  String email;
  String password;
  LoginEvent({required this.email, required this.password});
}

class LogoutEvent extends AuthEvents {}

class SignUpEvent extends AuthEvents {
  String email;
  String password;
  String? name;
  String? phone;
  SignUpEvent({
    required this.email,
    required this.password,
    this.name,
    this.phone,
  });
}
