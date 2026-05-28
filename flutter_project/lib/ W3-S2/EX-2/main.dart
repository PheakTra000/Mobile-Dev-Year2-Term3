import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(30),
        child: Container(
          margin: EdgeInsets.all(40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              "CADT STUDENT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
