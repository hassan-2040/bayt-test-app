import 'package:bayt_test_app/helpers/enums.dart';
import 'package:bayt_test_app/models/to_do.dart';
import 'package:dio/dio.dart';

class HomePageService {
  static final _dio = Dio();
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<ToDo>> fetchTodos({
    required int pageNumber,
    required SortById sort,
    required ToDoStatus status,
  }) async {
    try {
      final _sort = sort == SortById.desc ? 'desc' : 'asc';
      bool? _status;
      switch (status) {
        case ToDoStatus.completed:
          _status = true;
          break;
        case ToDoStatus.notCompleted:
          _status = false;
          break;
        case ToDoStatus.all:
          _status = null;
          break;
      }

      late String _url;

      if (_status != null) {
        _url = _baseUrl + '/todos?_sort=id&_order=$_sort&_page=$pageNumber&completed=$_status';
      } else {
        _url = _baseUrl + '/todos?_sort=id&_order=$_sort&_page=$pageNumber';
      }

      final _response = await _dio.get(_url);

      final List<ToDo> _tempTodos = [];

      final List _fetchedList = _response.data;

      for (var todo in _fetchedList) {
        _tempTodos.add(
          ToDo(
            id: todo['id'],
            userId: todo['userId'],
            title: todo['title'],
            completed: todo['completed'],
          ),
        );
      }

      return _tempTodos;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<ToDo>> searchToDos(String _query) async {
    try {

      final String _url = _baseUrl + '/todos?q=$_query';

      final _response = await _dio.get(_url);

      final List<ToDo> _tempTodos = [];

      final List _fetchedList = _response.data;

      for (var todo in _fetchedList) {
        _tempTodos.add(
          ToDo(
            id: todo['id'],
            userId: todo['userId'],
            title: todo['title'],
            completed: todo['completed'],
          ),
        );
      }

      return _tempTodos;
    } catch (error) {
      rethrow;
    }
  }

}
