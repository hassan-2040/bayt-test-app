import 'package:bayt_test_app/helpers/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filter_drawer_state.dart';

class FilterDrawerCubit extends Cubit<FilterDrawerState> {
  FilterDrawerCubit() : super(FilterDrawerSelectedFilters());

  SortById _sortById = SortById.desc;
  ToDoStatus _toDoStatus = ToDoStatus.all;

  updateSortById(SortById _sort){
    _sortById = _sort;
    emit(FilterDrawerSelectedFilters(sortById: _sortById, toDoStatus: _toDoStatus,));
  }

  updateToDoStatus(ToDoStatus _status){
    _toDoStatus = _status;
    emit(FilterDrawerSelectedFilters(sortById: _sortById, toDoStatus: _toDoStatus,));
  }


}
