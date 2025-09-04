import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.fieldlabel,
    required this.fieldprefixicon,
    required this.textcontoller,
    this.ispassword = false,
  });
  final String fieldlabel;
  final IconData fieldprefixicon;
  final TextEditingController textcontoller;
  final bool ispassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textcontoller,
      obscureText: ispassword,
      style: TextStyle(fontSize: 16),
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
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blueGrey.shade200, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),

        suffixIcon: ispassword
            ? IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility_outlined, color: Colors.grey[600]),
              )
            : null,
      ),
    );
  }
}
