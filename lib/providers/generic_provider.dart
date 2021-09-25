import 'package:bayt_test_app/bloc/to_do_list_bloc/to_do_list_cubit.dart';
import 'package:bayt_test_app/bloc/to_do_search_bloc/to_do_search_cubit.dart';
import 'package:bayt_test_app/models/local_user.dart';
import 'package:bayt_test_app/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GenericProvider with ChangeNotifier {
  late ToDoListCubit toDoListCubit;
  late ToDoSearchCubit toDoSearchCubit;
  late LocalUser localUser;
  late SharedPreferences prefs;

  Future<void> onLogin(LocalUser _user) async {
    _setLocalUser(_user);
    _initializeCubits();
    await _populateSearchStrings();
  }

  void saveRecentSearches(List<String> _searchStrings) {
    prefs.setStringList('searchStrings', _searchStrings);
  }

  Future<void> logout() async {
    await AuthenticationService.logOut();
  }

  Future<void> _populateSearchStrings() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? _searchStrings = prefs.getStringList('searchStrings');
    toDoSearchCubit.searchStrings = _searchStrings ?? [];
  }

  void _initializeCubits() {
    toDoListCubit = ToDoListCubit();
    toDoSearchCubit = ToDoSearchCubit();
  }

  void _setLocalUser(LocalUser _user) {
    localUser = _user;
  }

}