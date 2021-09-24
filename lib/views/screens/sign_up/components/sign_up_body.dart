import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:bayt_test_app/views/common_widgets/custom_elevated_button.dart';
import 'package:bayt_test_app/views/common_widgets/custom_text_field.dart';
import 'package:bayt_test_app/views/common_widgets/password_text_field.dart';
import 'package:bayt_test_app/views/common_widgets/previous_account_check_button.dart';
import 'package:bayt_test_app/views/screens/home/home_screen.dart';
import 'package:bayt_test_app/views/screens/login/login_screen.dart';
import 'package:bayt_test_app/views/screens/sign_up/components/sign_up_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignUpBackground(
      mainBody: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SIGN UP',
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
              "assets/images/sign_up.svg",
              height: SizeConfig.screenHeight * 0.35,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            const CustomTextField(
              hintText: 'Your Email',
              icon: Icons.person,
            ),
            const SizedBox(
              height: 20,
            ),
            const PasswordTextField(),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              text: 'SIGN UP',
              buttonColor: Theme.of(context).primaryColor,
              onPress: () {
                Navigator.of(context).pushReplacementNamed(HomeScreen.route);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            PreviousAccountCheckButton(
              login: false,
              press: () {
                Navigator.of(context).pushReplacementNamed(LoginScreen.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
