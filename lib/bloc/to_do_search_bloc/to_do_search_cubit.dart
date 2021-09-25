import 'package:bayt_test_app/models/to_do.dart';
import 'package:bayt_test_app/services/home_page_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'to_do_search_state.dart';

class ToDoSearchCubit extends Cubit<ToDoSearchState> {
  ToDoSearchCubit() : super(ToDoSearchInitial());

  late List<ToDo> searchResults = [];
  List<String> searchStrings = []; //for recent searches/search history

  void searchToDos(String _query) async {
    emit(ToDoSearchLoading());
    try {

      if (_query.length >= 3) searchStrings.add(_query);

      searchResults = await HomePageService.searchToDos(_query);

      print('searched');

      emit(ToDoSearchSuccess(searchResults));
    } catch (error) {
      emit(ToDoSearchFailure(error.toString()));
    }
  }

  void saveRecentSearches() async {

  }
}
