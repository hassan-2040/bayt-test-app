import 'package:bayt_test_app/models/to_do.dart';
import 'package:dio/dio.dart';

class HomePageService {
  static final _dio = Dio();
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<ToDo>> fetchTodos(int _pageNumber) async {
    try {
      final _response = await _dio.get(_baseUrl + '/todos?_page=$_pageNumber');

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
