import 'package:bayt_test_app/helpers/constants.dart';
import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final void Function() onPress;
  final Color buttonColor;
  final Color textColor;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.buttonColor = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: TextStyle(
            color: textColor,
            fontSize: SizeConfig.textSizeNormal,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          // style: TextStyle(
          //   color: textColor,
          // ),
        ),
      ),
    );
  }
}
