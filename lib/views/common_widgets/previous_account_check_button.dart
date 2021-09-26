import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class PreviousAccountCheckButton extends StatelessWidget {
  final bool login;
  final void Function() press;
  const PreviousAccountCheckButton({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "${translate('login.noAccount')} " : "${translate('signUp.alreadyAccount')} ",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? translate('login.noAccountSignUp') : translate('signUp.alreadyAccountSignIn'),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
