import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

  Response response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch user (HTTP ${response.statusCode})');
  }

  Map<String, dynamic> json = jsonDecode(response.body);

  User user = User.fromJson(json);
  print(user);
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  static User fromJson(Map<String, dynamic> json) {
    const String idKey = 'id';
    const String nameKey = 'name';
    const String emailKey = 'email';

    assert(json[idKey] is int);
    assert(json[nameKey] is String);
    assert(json[emailKey] is String);

    int id = json[idKey];
    String name = json[nameKey];
    String email = json[emailKey];

    return User(id: id, name: name, email: email);
  }

  @override
  String toString() {
    return "User $id — $name — $email";
  }
}
