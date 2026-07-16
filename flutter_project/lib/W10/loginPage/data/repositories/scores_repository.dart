import 'dart:convert';
import 'dart:io';

import 'package:flutter_project/W10/loginPage/data/dto/scores_dto.dart';
import 'package:flutter_project/W10/loginPage/model/score.dart';
import 'package:http/http.dart' as http;

class ScoresRepository {
  static ScoresRepository instance = ScoresRepository();

  Future<List<Score>> getScore(String token) async {
    final Uri baseUri = Uri.parse('http://localhost:3000');
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
}
