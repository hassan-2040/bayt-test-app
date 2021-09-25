import 'package:bayt_test_app/services/authentication_service.dart';
import 'package:bayt_test_app/views/screens/home/components/home_bottom_navigation_bar.dart';
import 'package:bayt_test_app/views/screens/home/components/home_indexed_stack.dart';
import 'package:bayt_test_app/views/screens/home/components/home_page/components/filter_button.dart';
import 'package:bayt_test_app/views/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _selectedIndex == 0 ? const Drawer() : null,
      appBar: AppBar(
        leading: _selectedIndex == 0 ? const FilterButton() : null,
        automaticallyImplyLeading: _selectedIndex == 0,
        title: _appBarTitle(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await AuthenticationService.logOut();
              Navigator.of(context).pushReplacementNamed(LoginScreen.route);
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
    if (_selectedIndex == 0) _title = 'JSONPlaceHolder To Dos';
    if (_selectedIndex == 1) _title = 'Marketplace';
    if (_selectedIndex == 2) _title = 'Your Account';
    if (_selectedIndex == 3) _title = 'Checkout';

    return Text(_title);
  }
}
