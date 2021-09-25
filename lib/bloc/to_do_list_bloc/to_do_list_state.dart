part of 'to_do_list_cubit.dart';

@immutable
abstract class ToDoListState {}

class ToDoListInitial extends ToDoListState {}

class ToDoListInitialLoading extends ToDoListState {}

class ToDoListListLoading extends ToDoListState {}

class ToDoListSuccess extends ToDoListState {}

class ToDoListFailure extends ToDoListState {
  final String errorMessage;
  ToDoListFailure(this.errorMessage);
}
