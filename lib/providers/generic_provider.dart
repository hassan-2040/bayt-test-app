import 'package:bayt_test_app/bloc/to_do_list_bloc/to_do_list_cubit.dart';
import 'package:bayt_test_app/models/local_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenericProvider with ChangeNotifier {
  late ToDoListCubit toDoListCubit;
  late LocalUser localUser;

  void initializeToDoListCubit() {
    toDoListCubit = ToDoListCubit();
  }

  void setLocalUser(LocalUser _user) {
    localUser = _user;
  }

}