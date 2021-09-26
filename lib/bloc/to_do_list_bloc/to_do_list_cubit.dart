import 'package:bayt_test_app/helpers/custom_error_responses.dart';
import 'package:bayt_test_app/helpers/enums.dart';
import 'package:bayt_test_app/models/to_do.dart';
import 'package:bayt_test_app/services/home_page_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'to_do_list_state.dart';

class ToDoListCubit extends Cubit<ToDoListState> {
  ToDoListCubit() : super(ToDoListInitial());

  List<ToDo> todos = [];
  SortById _sort = SortById.desc;
  ToDoStatus _status = ToDoStatus.all;
  int _page = 1;

  void applyFilters(SortById newSort, ToDoStatus newStatus,) {
    _sort = newSort;
    _status = newStatus;
    _page = 1;
    todos = [];
    getTodos();
  }

  Future<void> getTodos() async {

    if (todos.isEmpty) {
      emit(ToDoListInitialLoading());
    }

    try {
      List<ToDo> _temp = [];
      if (todos.isEmpty) {
        _temp = await HomePageService.fetchTodos(pageNumber: _page, sort: _sort, status: _status,);
      } else {
        _page++;
        _temp = await HomePageService.fetchTodos(pageNumber: _page, sort: _sort, status: _status,);
      }
      todos.addAll(_temp);

      emit(ToDoListSuccess());
    } on Exception catch (error) {
      emit(ToDoListFailure(customErrorResponses(error)));
    }
  }
}
