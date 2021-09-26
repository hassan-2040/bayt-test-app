import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;

  const HomeBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).backgroundColor,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (v) => onTap(v),
        selectedItemColor: Theme.of(context).primaryColor,
        selectedIconTheme: const IconThemeData(
          size: 30,
        ),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 10,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 15,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: translate('homeScreen.bottomNavigation.home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.card_giftcard),
            label: translate('homeScreen.bottomNavigation.market'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: translate('homeScreen.bottomNavigation.account'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            label: translate('homeScreen.bottomNavigation.checkout'),
          ),
        ],
      ),
    );
  }
}
