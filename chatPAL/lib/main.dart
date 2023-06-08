import 'package:chatpal/homePage.dart';
import 'package:chatpal/signUp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chatpal/forgotPassword.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/widgets.dart';
import 'package:chatpal/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line to initialize the binding
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(chatpal());
}


class chatpal extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFD36675),
      ),
      home: const LoginPage(),
    );
  }
}

