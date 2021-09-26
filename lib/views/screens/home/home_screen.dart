import 'package:bayt_test_app/providers/generic_provider.dart';
import 'package:bayt_test_app/services/authentication_service.dart';
import 'package:bayt_test_app/views/screens/home/components/home_bottom_navigation_bar.dart';
import 'package:bayt_test_app/views/screens/home/components/home_indexed_stack.dart';
import 'package:bayt_test_app/views/screens/home/components/home_page/components/filter_button.dart';
import 'package:bayt_test_app/views/screens/home/components/home_page/components/filter_drawer.dart';
import 'package:bayt_test_app/views/screens/login/login_screen.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'components/home_page/components/custom_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  static const route = 'homeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPopUpSelection(int value) async {
    switch (value) {
      case 1:
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(
              context.read<GenericProvider>().toDoSearchCubit),
        );
        break;
      case 2:
        final _locale = Localizations.localeOf(context).toString();
        if (_locale == 'ar') {
          changeLocale(context, 'en_US');
        } else {
          changeLocale(context, 'ar');
        }
        break;
      case 3:
        await context.read<GenericProvider>().logout();
        Navigator.of(context).pushReplacementNamed(LoginScreen.route);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _selectedIndex == 0
          ? Drawer(
              child: FilterDrawer(),
            )
          : null,
      appBar: AppBar(
        leading: _selectedIndex == 0 ? FilterButton() : null,
        automaticallyImplyLeading: _selectedIndex == 0,
        title: _appBarTitle(),
        centerTitle: true,
        actions: [
          _selectedIndex == 0
              ? PopupMenuButton<int>(
                  onSelected: _onPopUpSelection,
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<int>(
                        value: 1,
                        child: Text(
                            translate('homeScreen.popUpButton.searchButton')),
                      ),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Text(
                            translate('homeScreen.popUpButton.toggleLanguage')),
                      ),
                      PopupMenuItem<int>(
                        value: 3,
                        child: Text(
                            translate('homeScreen.popUpButton.logOutButton')),
                      ),
                    ];
                  },
                )
              : IconButton(
                  onPressed: () async {
                    await context.read<GenericProvider>().logout();
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.route);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
        ],
      ),
      body: HomeIndexedStack(selectedIndex: _selectedIndex),
      bottomNavigationBar: HomeBottomNavigationBar(
        onTap: _onTap,
        currentIndex: _selectedIndex,
      ),
    );
  }

  Widget _appBarTitle() {
    String _title = '';
    if (_selectedIndex == 0) _title = translate('homeScreen.appBarTitle.home');
    if (_selectedIndex == 1)
      _title = translate('homeScreen.appBarTitle.market');
    if (_selectedIndex == 2)
      _title = translate('homeScreen.appBarTitle.account');
    if (_selectedIndex == 3)
      _title = translate('homeScreen.appBarTitle.checkout');

    return Text(_title);
  }
}
