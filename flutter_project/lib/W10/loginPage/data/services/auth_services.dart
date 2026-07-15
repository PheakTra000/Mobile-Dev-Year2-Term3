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

import 'package:flutter_project/W10/loginPage/data/dto/user_dto.dart';
import 'package:flutter_project/W10/loginPage/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';


class AuthSession {
  final User user;
  final String token;

  AuthSession({required this.user, required this.token});
}


class AuthServices {
  static AuthServices instance = AuthServices();

  final Uri baseUri = Uri.parse('http://localhost:3000');

  AuthSession? session;

  bool get isLoggedIn => session != null;

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
      session = AuthSession(user: user, token: json['token']);

      print('logged as: ${user.name}');
      print(isLoggedIn);
    } on SocketException {
      throw ("No internet connection!");
    }
  }
  
  // logout
  Future<void> logout() async {
    session = null;
  }
}

// void main() {
//   AuthServices.instance.login(email: 'alice@mail.com', password: 'Alice12@@');
// }
