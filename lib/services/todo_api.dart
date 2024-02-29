import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:post_river/models/todo_model.dart';

class TodoApi {
  Future<List<TodoModel>> getTodos() async {
    try {
      List<TodoModel> todoList = [];
      final url = Uri.parse('https://dummyjson.com/todos?skip=5&limit=10');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final responseJson = convert.jsonDecode(response.body);
        for (var item in responseJson['todos']) {
          todoList.add(TodoModel.fromJson(item));
        }
      }
      return todoList;
    } catch (e) {
      return [];
    }
  }
}
