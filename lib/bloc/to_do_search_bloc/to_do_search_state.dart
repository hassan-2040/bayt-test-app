part of 'to_do_search_cubit.dart';

@immutable
abstract class ToDoSearchState {}

class ToDoSearchInitial extends ToDoSearchState {}

class ToDoSearchLoading extends ToDoSearchState {}

class ToDoSearchSuccess extends ToDoSearchState {
  final List<ToDo> searchResults;
  ToDoSearchSuccess(this.searchResults);
}

class ToDoSearchFailure extends ToDoSearchState {
  final String errorMessage;
  ToDoSearchFailure(this.errorMessage);
}
