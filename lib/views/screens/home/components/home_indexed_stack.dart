import 'package:bayt_test_app/views/screens/home/components/account_page.dart';
import 'package:bayt_test_app/views/screens/home/components/checkout_page.dart';
import 'package:bayt_test_app/views/screens/home/components/home_page/home_page.dart';
import 'package:bayt_test_app/views/screens/home/components/market_page.dart';
import 'package:flutter/material.dart';

class HomeIndexedStack extends StatelessWidget {
  final int selectedIndex;

  const HomeIndexedStack({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final List<Widget> _homePages = const [
     HomePage(),
     MarketPage(),
     AccountPage(),
     CheckoutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: _homePages,
    );
  }
}
