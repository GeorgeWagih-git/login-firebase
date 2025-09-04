import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/login_bloc.dart';
import 'package:newproject/blocs/login_events.dart';
import 'package:newproject/blocs/login_states.dart';
import 'package:newproject/widgets/app_materila_button.dart';
import 'package:newproject/widgets/app_text_form_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('SignUp', style: TextStyle(color: Colors.white)),
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
                  'SignUp',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Welcome to my app let's SignUp !",
                  style: TextStyle(fontSize: 25, color: Colors.indigo),
                ),
              ),
              SizedBox(height: 20),
              Divider(color: Colors.indigo, thickness: 0.5),
              SizedBox(height: 20),
              BlocBuilder<LoginBloc, AuthStates>(
                builder: (context, event) {
                  return Form(
                    child: Column(
                      children: [
                        AppTextFormField(
                          textcontoller: BlocProvider.of<LoginBloc>(
                            context,
                          ).signupemail,
                          fieldlabel: 'Email',
                          fieldprefixicon: Icons.email,
                        ),
                        SizedBox(height: 20),
                        AppTextFormField(
                          textcontoller: BlocProvider.of<LoginBloc>(
                            context,
                          ).signuppassword,
                          fieldlabel: 'Password',
                          fieldprefixicon: Icons.lock,
                          ispassword: true,
                        ),
                        SizedBox(height: 20),
                        AppMaterilaButton(
                          mterialbuttontext: 'SignUp',
                          onpressedfunction: () {
                            String userEmail = BlocProvider.of<LoginBloc>(
                              context,
                            ).signupemail.text;
                            String userPassword = BlocProvider.of<LoginBloc>(
                              context,
                            ).signuppassword.text;
                            if (userEmail.isNotEmpty &&
                                userPassword.isNotEmpty) {
                              BlocProvider.of<LoginBloc>(context).add(
                                SignUpEvent(
                                  email: userEmail,
                                  password: userPassword,
                                ),
                              );
                            }
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Have an account? Login'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
