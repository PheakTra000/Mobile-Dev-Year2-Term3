import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


enum UserRole { student, teacher, admin }

class User {
  final String name;
  final UserRole role;

  User({required this.name, required this.role});

  static User fromJSon(Map<String, dynamic> json) {
    return User(
      name: json['username'],
      role: UserRole.values.firstWhere((r) => r.name == json['role']),
    );
  }

  @override
  String toString() {
    return "user name = $name - role = ${role.name}";
  }
}

class AuthSession {
  final User user;
  final String token;

  AuthSession({required this.user, required this.token});
}



void main() async {
  final Uri baseUri = Uri.parse("http://localhost:3000");

  // 1- Login
  final Uri loginUrl = baseUri.replace(path: "login");
  Map<String, dynamic> body = {"username": "ronan", "password": "thebest"};
  Response response = await http.post(
    loginUrl,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(body),
  );

  Map<String, dynamic> json = jsonDecode(response.body);

  if (response.statusCode != 200) {
    String error = json["error"];
    throw Exception("Error : \n $error");
  }

  // 2- Get the token
  String token = json["token"];
  print(token);
  // 3- Decode token
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  User user = User.fromJSon(decodedToken);
  AuthSession session = AuthSession(user: user, token: token);



  // 4 - Use the token to request protected resources
  final Uri employeesUrl = baseUri.replace(path: "employees");

  response = await http.get(employeesUrl ,
     headers: {
      "Authorization": "Bearer ${session.token}",
      "Content-Type": "application/json",
    },
  );
  List<dynamic> employeeJson = jsonDecode(response.body);

  if (response.statusCode != 200) {
    String error = json["error"];
    throw Exception("Error : \n $error");
  }

  print("test");
  print(employeeJson);
}