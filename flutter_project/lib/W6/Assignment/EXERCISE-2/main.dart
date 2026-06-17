import 'package:flutter/material.dart';
import 'package:flutter_project/W6/Assignment/EXERCISE-2/data/profile_data.dart';
import 'ui/screens/profile.dart';
 
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(ronanProfile: ronanProfile),
  ));
}
