import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/todo.dart';
import '../dto/todo_dto.dart';
import 'repository_exception.dart';

class TodoRepository {
  static final global = TodoRepository(); // unique instance

  // final List<Todo> fakeTodos = [
  //   Todo(id: '1', title: 'Buy groceries', completed: false),
  //   Todo(id: '2', title: 'Finish Flutter homework', completed: true),
  //   Todo(id: '3', title: 'Call the dentist', completed: false),
  //   Todo(id: '4', title: 'Read 20 pages of a book', completed: true),
  //   Todo(id: '5', title: 'Go for a 30-minute walk', completed: false),
  // ];

  final Uri _baseUri = Uri.parse(
    "https://mobile-dev-exercise2-default-rtdb.firebaseio.com/",
  );

  Future<List<Todo>> getTodos() async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //
    try {
      Uri url = _baseUri.replace(path: "/todos.json");
      http.Response response = await http.get(url);

      if (response.statusCode != 200) {
        throw RepositoryException("Error ${response.statusCode}");
      }

      final decoded = jsonDecode(response.body);

      List<Todo> todos = [];

      if (decoded is List) {
        for (int i = 1; i < decoded.length; i++) {
          todos.add(
            TodoDto.fromJson(i.toString(), decoded[i] as Map<String, dynamic>),
          );
        }
      } else {
        Map<String, dynamic> data = decoded as Map<String, dynamic>;
        for (var entry in data.entries) {
          Todo todo = TodoDto.fromJson(
            entry.key,
            entry.value as Map<String, dynamic>,
          );
          todos.add(todo);
        }
      }

      return todos;
    } on RepositoryException catch (e) {
      throw (e.message);
    }

    // return Future.delayed(Duration(seconds: 1), () {
    //   return fakeTodos;

    //  TODO
    // Ensure the message is displayed on the UI if error occured
    //throw RepositoryException("No wifi !");

    // });
  }

  Future<void> updateCompleted(String todoId, bool completed) async {
    Uri url = _baseUri.replace(path: "/todos/$todoId.json");
    http.Response response = await http.patch(
      url,
      body: jsonEncode({"completed": completed}),
    );

    if (response.statusCode != 200) {
      throw RepositoryException("Failed to update todo");
    }

    //  TODO
    //  Adapt the code to handle firebase data fetch
    //

    // int index = fakeTodos.indexWhere((e) => e.id == todoId);
    // fakeTodos[index] = fakeTodos[index].copyWith(completed);

    // return Future.delayed(Duration(microseconds: 1), () => true);
  }
}
