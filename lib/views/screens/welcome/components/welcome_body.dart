
import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:bayt_test_app/views/common_widgets/custom_elevated_button.dart';
import 'package:bayt_test_app/views/screens/login/login_screen.dart';
import 'package:bayt_test_app/views/screens/sign_up/sign_up_screen.dart';
import 'package:bayt_test_app/views/screens/welcome/components/welcome_background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {

  late String _locale;

  @override
  void didChangeDependencies() {
    _locale = Localizations.localeOf(context).toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeBackground(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              translate('title'),
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
                Navigator.of(context).pushNamed(SignUpScreen.route);
              },
            ),
            RawMaterialButton(
              constraints: const BoxConstraints(),
              onPressed: () {
                if (_locale == 'ar') {
                  changeLocale(context, 'en_US');
                  setState(() {
                    _locale = 'en_US';
                  });
                } else {
                  changeLocale(context, 'ar');
                  setState(() {
                    _locale = 'ar';
                  });
                }
              },
              child: Text(
                'Switch Language to ${_locale == 'ar' ? 'EN' : 'AR'}',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: SizeConfig.textSizeSmall,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
