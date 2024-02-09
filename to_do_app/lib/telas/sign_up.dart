// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in.dart';
import 'package:flutter/gestures.dart';


class SignUp extends StatefulWidget {
  const SignInSignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignupState();
}
class _SignupState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Row(), //nome
              TextField(), //textfield para nome
            ],
          ),
          Column(), //sobrenome
          Column(), //email
          Column(), //senha
          Column(), //confirmar senha
          //TextButton(), //criar conta
        ],
      ),
    );
  }
}