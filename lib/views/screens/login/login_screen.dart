import 'package:bayt_test_app/views/screens/login/components/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  static const route = 'loginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
