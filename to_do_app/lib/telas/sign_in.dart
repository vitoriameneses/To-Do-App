// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import '../models/signin_signup_model.dart';

class SignInSignUp extends StatefulWidget {
  const SignInSignUp({Key? key}) : super(key: key);

  @override
  State<SignInSignUp> createState() => _SigninSignupState();
}

class _SigninSignupState extends State<SignInSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color.fromARGB(255, 255, 88, 51),
              Color.fromARGB(255, 199, 0, 56),
              Color.fromARGB(255, 144, 12, 63),
              Color.fromARGB(255, 88, 24, 69),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'To Do App',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontFamily: 'Space Grotesk',
                          color: Colors.white70,
                        ),
                  ),
                ],
              ), //linha pro titulo
              Column(
                children: [
                  Row(
                    children: [
                      //email text
                      Text(
                        'Email:',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontFamily: 'Space Grotesk',
                              color: Color.fromARGB(255, 88, 24, 69),
                            ),
                      ),
                    ],
                  ),
                  TextField(), //textfield
                ],
              ), //coluna para  email
              Column(
                children: [
                  Row(
                    children: [
                      //email text
                      Text(
                        'Password:',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontFamily: 'Space Grotesk',
                              color: Color.fromARGB(255, 88, 24, 69),
                            ),
                      ),
                    ],
                  ),
                  TextField(),
                ],
              ), //coluna para senha
              //botao
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'Space Grotesk',
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {}, //ir para a pagina sign up
                child: Row(
                  children: [
                    Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontFamily: 'Space Grotesk',
                            color: Color.fromARGB(220, 88, 24, 69),
                          ),
                    ),
                  ],
                ), //Row para sign up
              ),
            ],
          ),
        ),
      ),
    );
  }
}
