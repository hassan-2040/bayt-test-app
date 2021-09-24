
import 'package:dio/dio.dart';

class HomePageService{
  static final _dio = Dio();
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<void> fetchAllTodos() async {
    try {
      final _response = await _dio.get(_baseUrl + '/todos');
      print(_response.data.toString());
    } catch (error) {
      rethrow;
    }
  }

}