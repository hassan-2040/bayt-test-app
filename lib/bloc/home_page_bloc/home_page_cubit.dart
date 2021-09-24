import 'package:bayt_test_app/services/home_page_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  void getAllTodos() async {
    emit(HomePageLoading());
    try {
      await HomePageService.fetchAllTodos();
      emit(HomePageSuccess());
    } catch (error) {
      emit(HomePageFailure(error.toString()));
    }
  }
}
