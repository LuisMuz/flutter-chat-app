// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void signUp() async {
    if (password.text == confirmPassword.text) {
      final AuthService authService =
          Provider.of<AuthService>(context, listen: false);
      try {
        await authService.signUpWithEmailandPassword(email.text, password.text);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${e.toString()} error'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password does not match"),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message, size: 80),
                  SizedBox(height: 100),
                  Text(
                    "Let's create an acount!",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 30),
                  MyFieldText(
                    controller: email,
                    hint: "Email",
                    obscure: false,
                    icon: Icon(Icons.email),
                  ),
                  SizedBox(height: 30),
                  MyFieldText(
                    controller: password,
                    hint: "Password",
                    obscure: true,
                    icon: Icon(Icons.password),
                  ),
                  SizedBox(height: 30),
                  MyFieldText(
                    controller: confirmPassword,
                    hint: "Confirm password",
                    obscure: true,
                    icon: Icon(Icons.password),
                  ),
                  SizedBox(height: 30),
                  MyButton(
                    onTap: signUp,
                    textButton: "Sign up",
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a member?"),
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Login now",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
