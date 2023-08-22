import 'dart:convert';

import 'package:bloc_prj/features/todos/models/todo_models.dart';
import 'package:http/http.dart' as http;

class TodoRepo {
  static Future<List<TodoModel>> fetchTodos() async {
    var client = http.Client();
    List<TodoModel> todos = [];

    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        TodoModel todo = TodoModel.fromMap(result[i] as Map<String, dynamic>);
        todos.add(todo);
      }

      return todos;
    } catch (e) {
      return [];
    }
  }
}
