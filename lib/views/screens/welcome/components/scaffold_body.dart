import 'package:bayt_test_app/helpers/constants.dart';
import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:bayt_test_app/views/common_widgets/custom_elevated_button.dart';
import 'package:bayt_test_app/views/screens/welcome/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'WELCOME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: SizeConfig.textSizeMainHeading,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            SvgPicture.asset(
              "assets/images/welcome.svg",
              height: SizeConfig.screenHeight * 0.4,
            ),
            CustomElevatedButton(
              text: 'LOGIN',
              onPress: () {
                print('log in button');
              },
            ),
            CustomElevatedButton(
              text: 'SIGN UP',
              buttonColor: primaryColorLight,
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
