import 'package:bayt_test_app/helpers/constants.dart';
import 'package:bayt_test_app/views/screens/home/home_screen.dart';
import 'package:bayt_test_app/views/screens/login/login_screen.dart';
import 'package:bayt_test_app/views/screens/sign_up/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bayt_test_app/views/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        appBarTheme: const AppBarTheme(
          color: primaryColor,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),

      routes: {
        LoginScreen.route: (context) => const LoginScreen(),
        SignUpScreen.route: (context) => const SignUpScreen(),
        HomeScreen.route: (context) => const HomeScreen(),
      },
      home: const WelcomeScreen(),
    );
  }
}
