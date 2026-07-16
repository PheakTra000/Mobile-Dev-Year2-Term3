// import 'dart:convert';

// import 'package:flutter_project/W10/loginPage/data/dto/user_dto.dart';
// import 'package:flutter_project/W10/loginPage/model/user.dart';
// import 'package:http/http.dart' as http;
// import 'package:jwt_decoder/jwt_decoder.dart';

// class AuthSession {
//   final User user;
//   final String token;

//   AuthSession({required this.user, required this.token});
// }

// class AuthService {
//   // final String email;
//   // final String password;

//   // AuthService({required this.email, required this.password});

//   AuthService._();

//   // static AuthService instance = AuthService(email: '', password: this.password); // single instance

//   AuthSession? session;

//   bool get isLoggedIn => session != null;

//   Future<void> login() async {
//     final Uri baseUri = Uri.parse("http://localhost:3000");

//     // 1- Login
//     final Uri loginUrl = baseUri.replace(path: "login");
//     Map<String, dynamic> body = {"email": email, "password": password};
//     http.Response response = await http.post(
//       loginUrl,
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(body),
//     );

//     Map<String, dynamic> json = jsonDecode(response.body);

//     if (response.statusCode != 200) {
//       String error = json["error"];
//       throw Exception("Error : \n $error");
//     }

//     // 2- Get the token
//     String token = json["token"];

//     // 3- Decode token
//     Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
//     User user = UserDto.fromJson(decodedToken);
//     print(decodedToken);

//     // 4 - Update the session
//     session = AuthSession(user: user, token: token);
//   }

//   Future<void> logout() async {
//     session = null; // nothing else needed for now
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:flutter_project/W10/loginPage/data/dto/scores_dto.dart';
import 'package:flutter_project/W10/loginPage/data/dto/user_dto.dart';
import 'package:flutter_project/W10/loginPage/model/auth_session.dart';
import 'package:flutter_project/W10/loginPage/model/score.dart';
import 'package:flutter_project/W10/loginPage/model/user.dart';
import 'package:flutter_project/W10/loginPage/ui/screens/app_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

// class AuthSession {
//   final User user;
//   final String token;

//   AuthSession({required this.user, required this.token});
// }

class AuthServices {
  static AuthServices instance = AuthServices();
  final storage = FlutterSecureStorage();

  final Uri baseUri = Uri.parse('http://localhost:3000');

  AuthSession? session;

  bool isLoggedIn() => session != null;

  Future<void> login({required String email, required String password}) async {
    final Uri loginUrl = baseUri.replace(path: '/login');
    Map<String, dynamic> body = {"email": email, "password": password};

    try {
      http.Response response = await http.post(
        loginUrl,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      Map<String, dynamic> json = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ("Cannot connect to server: ${json['error']}");
      }

      Map<String, dynamic> decodedToken = JwtDecoder.decode(json['token']);
      User user = UserDto.fromJson(decodedToken);
      session = AuthSession(user: user, token: json['token'], );
      storage.write(key: 'token', value: json['token']);

      print('logged as: ${user.name}');
      print(isLoggedIn());
    } on SocketException {
      throw ("No internet connection!");
    }
  }

  Future<void> restoreSesssion() async {
    String? token = await storage.read(key: 'token');
    if (token == null || token.isEmpty){
      return;
    }
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      User user = UserDto.fromJson(decodedToken);
      session = AuthSession(user: user, token: token);
  }

  Future<void> destroySession() async {
    await storage.delete(key: 'token');
  }

  Future<List<Score>> getScore(String token) async {
    final Uri scoreUrl = baseUri.replace(path: '/scores');

    try {
      http.Response response = await http.get(
        scoreUrl,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      
      List<dynamic> json = jsonDecode(response.body);
      List<Score> score = ScoresDto.fromJsonList(json);
      return score;

    } on SocketException {
      throw ('No internet Connection');
    }
  }

  // logout
  Future<void> logout() async {
    session = null;
  }
}

// void main() {
//   AuthServices.instance.login(email: 'alice@mail.com', password: 'Alice12@@');

//   String token =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6IkFsaWNlIiwicm9sZSI6InN0dWRlbnQiLCJpYXQiOjE3ODQxODU2MzAsImV4cCI6MTc4NDE4OTIzMH0.9c7T-Q9xyHlfYXxfDzv7drSGFfe0oFL6PoyM-89WMsM';

//   AuthServices.instance.getScore(token);
// }
