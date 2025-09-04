import 'package:flutter/material.dart';

class AppMaterilaButton extends StatelessWidget {
  const AppMaterilaButton({
    super.key,
    required this.mterialbuttontext,
    required this.onpressedfunction,
  });
  final String mterialbuttontext;
  final Function onpressedfunction;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onpressedfunction(),
      color: Colors.blueAccent,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      child: Text(
        mterialbuttontext,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
