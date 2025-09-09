import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/blocs/Vsibility_bloc/visibility_bloc.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.fieldlabel,
    required this.fieldprefixicon,
    required this.textcontoller,
    this.ispassword = false,
    this.isEmail = false,
    this.isphoneNumber = false,
  });
  final String fieldlabel;
  final IconData fieldprefixicon;
  final TextEditingController textcontoller;
  final bool ispassword;
  final bool isEmail;
  final bool isphoneNumber;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VisibilityBloc(),
      child: BlocBuilder<VisibilityBloc, bool>(
        builder: (context, state) {
          return TextFormField(
            keyboardType: isphoneNumber
                ? TextInputType.number
                : TextInputType.text,
            controller: textcontoller,
            obscureText: ispassword ? !state : false,
            style: TextStyle(fontSize: 16, color: Colors.black),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              if (ispassword) {
                if (value.length < 6) {
                  return 'Password too short';
                }
              } else if (isEmail) {
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Enter a valid email address';
                }
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: fieldlabel,
              labelStyle: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
              ),
              prefixIcon: Icon(fieldprefixicon, color: Colors.blueAccent),
              fillColor: Colors.blueGrey[50],
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.blueGrey.shade200,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              suffixIcon: ispassword
                  ? IconButton(
                      onPressed: () {
                        BlocProvider.of<VisibilityBloc>(
                          context,
                        ).add(VisibilityEvent(state: state));
                      },
                      icon: Icon(
                        state
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.grey[600],
                      ),
                    )
                  : null,
            ),

            inputFormatters: isEmail
                ? [FilteringTextInputFormatter.deny(RegExp(r'\s'))]
                : isphoneNumber
                ? [FilteringTextInputFormatter.digitsOnly]
                : [],
          );
        },
      ),
    );
  }
}

String? defaultValidator(String? value, {bool isPassword = false}) {
  if (value == null || value.isEmpty) return 'This field is required';
  if (isPassword && value.length < 6) return 'Password too short';
  return null;
}
