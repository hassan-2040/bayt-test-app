import 'package:bayt_test_app/helpers/constants.dart';
import 'package:bayt_test_app/views/screens/login/login_screen.dart';
import 'package:bayt_test_app/views/screens/sign_up/sign_up_screen.dart';
import 'package:bayt_test_app/views/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bayt Test App',
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorLight: primaryColorLight,
        backgroundColor: primaryColorBackground,
        // primarySwatch: Colors.indigo,
      ),
      routes: {
        LoginScreen.route: (context) => const LoginScreen(),
        SignUpScreen.route: (context) => const SignUpScreen(),
      },
      home: const WelcomeScreen(),
    );
  }
}
