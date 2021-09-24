import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:bayt_test_app/views/screens/welcome/components/scaffold_body.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: ScaffoldBody(),
    );
  }
}
