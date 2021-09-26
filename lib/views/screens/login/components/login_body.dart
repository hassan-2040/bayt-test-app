import 'package:bayt_test_app/bloc/login_bloc/login_cubit.dart';
import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:bayt_test_app/services/authentication_service.dart';
import 'package:bayt_test_app/views/common_widgets/custom_elevated_button.dart';
import 'package:bayt_test_app/views/common_widgets/custom_text_field.dart';
import 'package:bayt_test_app/views/common_widgets/feedback_widgets.dart';
import 'package:bayt_test_app/views/common_widgets/password_text_field.dart';
import 'package:bayt_test_app/views/common_widgets/previous_account_check_button.dart';
import 'package:bayt_test_app/views/screens/home/home_screen.dart';
import 'package:bayt_test_app/views/screens/login/components/login_background.dart';
import 'package:bayt_test_app/views/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();

  final LoginCubit _loginCubit = LoginCubit();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin(){
    if(_formKey.currentState!.validate()) {
      _loginCubit.loginUser(
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginBackground(
      mainBody: BlocListener<LoginCubit, LoginState>(
        bloc: _loginCubit,
        listener: (context, state) {
          if (state is LoginFailure) {
            Navigator.of(context).pop();
            FeedbackWidgets(context)
                .showSnackBar(snackBarText: state.errorMessage);
          }
          if (state is LoginLoading) {
            FeedbackWidgets(context).showLoading();
          }
          if (state is LoginSuccess) {
            Navigator.of(context).pushReplacementNamed(HomeScreen.route);
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translate('login.title'),
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
                  "assets/images/login.svg",
                  height: SizeConfig.screenHeight * 0.35,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                CustomTextField(
                  hintText: translate('login.emailHint'),
                  icon: Icons.person,
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordTextField(
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  text: translate('login.loginButton'),
                  buttonColor: Theme.of(context).primaryColor,
                  onPress: _submitLogin,
                ),
                const SizedBox(
                  height: 30,
                ),
                PreviousAccountCheckButton(
                  press: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.route);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
