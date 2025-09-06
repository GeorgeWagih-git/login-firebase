import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_events.dart';
import 'package:newproject/blocs/login_bloc/login_states.dart';
import 'package:newproject/screens/home_screen.dart';
import 'package:newproject/screens/signup_screen.dart';
import 'package:newproject/widgets/app_materila_button.dart';
import 'package:newproject/widgets/app_text_form_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  bool welcome = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Welcome to my app !',
                  style: TextStyle(fontSize: 30, color: Colors.indigo),
                ),
              ),
              SizedBox(height: 20),
              Divider(color: Colors.indigo, thickness: 0.5),
              SizedBox(height: 20),
              BlocListener<LoginBloc, LoginAuthStates>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Welcome",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.purple,
                        duration: Duration(seconds: 3),
                      ),
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(userID: state.uid),
                      ),
                    );
                  } else if (state is LoginSuccess && !welcome) {
                    welcome = true;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Welcome",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else if (state is LoginFail) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(state.error),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: BlocBuilder<LoginBloc, LoginAuthStates>(
                  builder: (context, event) {
                    return Form(
                      key: BlocProvider.of<LoginBloc>(context).loginformKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            isEmail: true,
                            textcontoller: BlocProvider.of<LoginBloc>(
                              context,
                            ).email,
                            fieldlabel: 'Email',
                            fieldprefixicon: Icons.email,
                          ),
                          SizedBox(height: 20),
                          AppTextFormField(
                            textcontoller: BlocProvider.of<LoginBloc>(
                              context,
                            ).password,
                            fieldlabel: 'Password',
                            fieldprefixicon: Icons.lock,
                            ispassword: true,
                          ),
                          SizedBox(height: 20),
                          AppMaterilaButton(
                            mterialbuttontext: 'Login',
                            onpressedfunction: () {
                              if (BlocProvider.of<LoginBloc>(
                                context,
                              ).loginformKey.currentState!.validate()) {
                                String userEmail = BlocProvider.of<LoginBloc>(
                                  context,
                                ).email.text;
                                String userPassword =
                                    BlocProvider.of<LoginBloc>(
                                      context,
                                    ).password.text;
                                if (userEmail.isNotEmpty &&
                                    userPassword.isNotEmpty) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    LoginEvent(
                                      email: userEmail,
                                      password: userPassword,
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                              );
                            },
                            child: Text('Don,t have an account? SignUp'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
