import 'package:bayt_test_app/models/to_do.dart';
import 'package:bayt_test_app/services/home_page_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'to_do_list_state.dart';

class ToDoListCubit extends Cubit<ToDoListState> {
  ToDoListCubit() : super(ToDoListInitial());

  final List<ToDo> todos = [];
  int _page = 1;

  Future<void> getTodos() async {

    if (todos.isEmpty) {
      emit(ToDoListInitialLoading());
    }

    try {

      List<ToDo> _temp = [];
      if(todos.isEmpty) {
        _temp = await HomePageService.fetchTodos(_page);
      } else {
        _page++;
        _temp = await HomePageService.fetchTodos(_page);
      }
      todos.addAll(_temp);
      print('todo length ${todos.length}');
      emit(ToDoListSuccess());
    } catch (error) {
      emit(ToDoListFailure(error.toString()));
    }
  }
}
