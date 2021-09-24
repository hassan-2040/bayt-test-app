import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: SizeConfig.screenWidth * 0.7,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        cursorColor: Theme.of(context).primaryColor,
        obscureText: _obscureText,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Theme.of(context).primaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              _obscureText = !_obscureText;
            }),
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColor,
            ),
          ),
          hintText: 'Your Password',
          border: InputBorder.none,
        ),
      ),
    );
  }
}