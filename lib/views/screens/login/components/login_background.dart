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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -20,
            right: 0,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight * 0.4,
            left: -20,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: -10,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
          mainBody,
        ],
      ),
    );
  }
}
