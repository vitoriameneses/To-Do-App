// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_build_context_synchronously, avoid_print

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import './telas/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:to_do_app/telas/home.dart';

//import 'package:fluttertoast/fluttertoast.dart';
//import '../models/signin_signup_model.dart';

class SignInSignUp extends StatefulWidget {
  const SignInSignUp({super.key});
  //final User _user;
  @override
  State<SignInSignUp> createState() => _SignInSignupState();
}

class _SignInSignupState extends State<SignInSignUp> {
 // late User _user;
  bool _isSigningOut = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color.fromARGB(200, 255, 88, 51),
              Color.fromARGB(200, 199, 0, 56),
              Color.fromARGB(200, 144, 12, 63),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 50, 0, 0),
                child: Row(
                  children: [
                    Text(
                      'To Do App',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontFamily: 'Space Grotesk',
                                color: Colors.white,
                              ),
                    ),
                  ],
                ), //linha pro titulo,
              ),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Row(
                      children: [
                        //email text
                        Text(
                          'Email:',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'Space Grotesk',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                    child: TextField(
                      controller: _emailController,
                      autofocus: true,
                      cursorColor: Colors.black38,
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ), //coluna para  email
              Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                    child: Row(
                      children: [
                        //email text
                        Text(
                          'Password:',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'Space Grotesk',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                    child: TextField(
                      controller: _passwordController,
                      cursorColor: Colors.black38,
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                      autofocus: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ), //coluna para senha
              //botao
              ElevatedButton(
                onPressed: () async {
                  String email = _emailController.text.trim();
                  String password = _passwordController.text.trim();
                  try {
                    final UserCredential userCredential =
                        await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  } catch (e) {
                    print("Error $e");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text(
                              "Failed to sign in. Please check your email and password."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                  backgroundColor: Color.fromARGB(255, 88, 24, 69),
                ),
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: 'Space Grotesk',
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    // context.pushNamed('createacc');
                  },
                  child: RichText(
                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up here',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontFamily: 'Space Grotesk',
                                    color: Color.fromARGB(255, 255, 88, 51),
                                    fontWeight: FontWeight.w500,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()));
                            },
                        ),
                      ],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
