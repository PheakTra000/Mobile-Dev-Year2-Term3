import 'dart:ui';

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({
    required this.iconData,
    required this.text,
    required this.background,
  });

  final IconData iconData;
  final String text;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 40),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: background,
        ),
        child: Row(
          children: [
            SizedBox(width: 30),
            Icon(iconData, size: 30, color: Colors.white),
            SizedBox(width: 20),
            Text(text, style: TextStyle(fontSize: 30, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Hobbies')),
        body: Container(
          color: Colors.grey,
          child: Column(
            children: [
              SizedBox(height: 40),
              MyCard(
                iconData: Icons.search,
                text: 'Travelling',
                background: Colors.green,
              ),
              SizedBox(height: 10),
              MyCard(
                iconData: Icons.skateboarding,
                text: 'Skating',
                background: Colors.blue,
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    ),
  );
}
