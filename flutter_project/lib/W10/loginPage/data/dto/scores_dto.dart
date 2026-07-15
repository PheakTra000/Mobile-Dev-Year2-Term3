
import 'package:flutter_project/W10/loginPage/model/score.dart';

class ScoresDto {
  static List<Score> fromJsonList(List<dynamic> jsonList) {
    List<Score> scores = [];
    for (int i = 0; i < jsonList.length; i++) {
      Map<String, dynamic> json = jsonList[i];
      scores.add(Score(title: json['title'] as String, value: json['value'] as int ));
    }
    return scores;
  }
}
