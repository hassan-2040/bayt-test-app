import 'package:bayt_test_app/helpers/constants.dart';
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
      home: const WelcomeScreen(),
    );
  }
}
