
import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:bayt_test_app/views/common_widgets/custom_elevated_button.dart';
import 'package:bayt_test_app/views/screens/login/login_screen.dart';
import 'package:bayt_test_app/views/screens/welcome/components/welcome_background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WelcomeBackground(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'WELCOME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: SizeConfig.textSizeMainHeading,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            SvgPicture.asset(
              "assets/images/welcome.svg",
              height: SizeConfig.screenHeight * 0.35,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            CustomElevatedButton(
              text: 'LOGIN',
              buttonColor: Theme.of(context).primaryColor,
              onPress: () {
                Navigator.of(context).pushNamed(LoginScreen.route);
              },
            ),
            CustomElevatedButton(
              text: 'SIGN UP',
              buttonColor: Theme.of(context).primaryColorLight,
              onPress: () {
                print('sign up');
              },
            ),
          ],
        ),
      ),
    );
  }
}
