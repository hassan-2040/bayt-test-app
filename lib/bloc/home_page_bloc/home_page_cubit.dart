import 'package:bayt_test_app/models/to_do.dart';
import 'package:bayt_test_app/services/home_page_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  void getAllTodos() async {
    emit(HomePageLoading());
    try {
      final List<ToDo> _todos = await HomePageService.fetchAllTodos();
      emit(HomePageSuccess(_todos));
    } catch (error) {
      emit(HomePageFailure(error.toString()));
    }
  }
}
