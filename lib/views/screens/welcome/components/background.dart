import 'package:bayt_test_app/helpers/constants.dart';
import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget mainBody;
  const Background({
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
            left: -20,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColorBackground,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight * 0.2,
            right: -20,
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColorBackground,
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColorBackground,
              ),
            ),
          ),
          mainBody,
        ],
      ),
    );
  }
}
