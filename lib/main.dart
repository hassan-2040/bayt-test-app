import 'package:bayt_test_app/helpers/constants.dart';
import 'package:bayt_test_app/providers/generic_provider.dart';
import 'package:bayt_test_app/views/screens/home/home_screen.dart';
import 'package:bayt_test_app/views/screens/login/login_screen.dart';
import 'package:bayt_test_app/views/screens/sign_up/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bayt_test_app/views/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en_US', supportedLocales: ['en_US', 'ar']);
  runApp(
    LocalizedApp(
      delegate,
      MultiProvider(
        providers: [
          ListenableProvider<GenericProvider>(create: (_) => GenericProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        title: 'Bayt Test App',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        theme: ThemeData(
          primaryColor: primaryColor,
          primaryColorLight: primaryColorLight,
          backgroundColor: primaryColorBackground,
          appBarTheme: const AppBarTheme(
            color: primaryColor,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        ),
        routes: {
          LoginScreen.route: (context) => const LoginScreen(),
          SignUpScreen.route: (context) => const SignUpScreen(),
          HomeScreen.route: (context) => const HomeScreen(),
        },
        home: const WelcomeScreen(),
      ),
    );
  }
}
