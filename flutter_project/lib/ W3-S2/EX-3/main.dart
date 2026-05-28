import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                  'OOP',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                  'DART',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                  'FLUTTER',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
