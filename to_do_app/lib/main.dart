import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/telas/home.dart';
import './telas/sign_in.dart';
import './telas/sign_up.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        // ignore: prefer_const_constructors
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 88, 51)),
        useMaterial3: true,
      ),
      home: const SignInSignUp(),
    );
  }
}
