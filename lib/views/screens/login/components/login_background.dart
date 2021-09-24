import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final Widget mainBody;

  const LoginBackground({
    Key? key,
    required this.mainBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: double.infinity,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.screenHeight * 0.3,
              right: 30,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 80,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            mainBody,
          ],
        ),
      ),
    );
  }
}
