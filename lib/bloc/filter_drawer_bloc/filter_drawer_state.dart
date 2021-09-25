part of 'filter_drawer_cubit.dart';

@immutable
abstract class FilterDrawerState {}

class FilterDrawerSelectedFilters extends FilterDrawerState {
  final SortById sortById;
  final ToDoStatus toDoStatus;

  FilterDrawerSelectedFilters({
    this.sortById = SortById.desc,
    this.toDoStatus = ToDoStatus.all,
  });
}
