import 'package:flutter_project/W10/loginPage/model/user.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthSession {
  final User user;
  final String token;

  AuthSession({required this.user, required this.token});
}