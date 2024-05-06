import 'package:flutter/material.dart';

class MyFieldText extends StatelessWidget {
  const MyFieldText(
      {super.key,
      required this.controller,
      required this.hint,
      required this.obscure,
      required this.icon});

  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: icon,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: hint,
      ),
    );
  }
}
