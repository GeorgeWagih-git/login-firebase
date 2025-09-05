import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_bloc.dart';
import 'package:newproject/blocs/login_bloc/login_events.dart';
import 'package:newproject/blocs/login_bloc/login_states.dart';
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
              BlocListener<LoginBloc, LoginAuthStates>(
                listener: (context, state) {
                  if (state is SignUPSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Signed up successfully now Login with your Email",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.purple,
                        duration: Duration(seconds: 3),
                      ),
                    );
                    Navigator.of(context).pop();
                  } else if (state is SignUPFail) {
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
                      key: BlocProvider.of<LoginBloc>(context).signupformKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            isEmail: true,
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
                          AppTextFormField(
                            fieldlabel: 'Phone Number',
                            fieldprefixicon: Icons.phone,
                            textcontoller: BlocProvider.of<LoginBloc>(
                              context,
                            ).signupphoneNumber,
                            isphoneNumber: true,
                          ),
                          SizedBox(height: 20),
                          AppTextFormField(
                            fieldlabel: 'Name',
                            fieldprefixicon: Icons.person,
                            textcontoller: BlocProvider.of<LoginBloc>(
                              context,
                            ).signupname,
                          ),
                          SizedBox(height: 20),
                          AppMaterilaButton(
                            mterialbuttontext: 'SignUp',
                            onpressedfunction: () {
                              if (BlocProvider.of<LoginBloc>(
                                context,
                              ).signupformKey.currentState!.validate()) {
                                String userEmail = BlocProvider.of<LoginBloc>(
                                  context,
                                ).signupemail.text;
                                String userPassword =
                                    BlocProvider.of<LoginBloc>(
                                      context,
                                    ).signuppassword.text;
                                String userName = BlocProvider.of<LoginBloc>(
                                  context,
                                ).signupname.text;
                                String userPhone = BlocProvider.of<LoginBloc>(
                                  context,
                                ).signupphoneNumber.text;
                                if (userEmail.isNotEmpty &&
                                    userPassword.isNotEmpty) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    SignUpEvent(
                                      email: userEmail,
                                      password: userPassword,
                                      name: userName,
                                      phone: userPhone,
                                    ),
                                  );
                                }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
