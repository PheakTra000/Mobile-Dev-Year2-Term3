import 'package:flutter_project/W10/loginPage/model/user.dart';

class UserDto {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
      expiration: DateTime.fromMillisecondsSinceEpoch(
        (json['exp'] as int) * 1000,
      ),
    );
  }
}