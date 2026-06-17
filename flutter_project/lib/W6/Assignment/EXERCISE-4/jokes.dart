import 'package:flutter_project/W6/Assignment/EXERCISE-4/jokes_model.dart';

List<JokeData> jokes = [
  for (int i = 0; i < 10; i++) 
    JokeData(title: 'Title $i', description: 'Description $i')
];

