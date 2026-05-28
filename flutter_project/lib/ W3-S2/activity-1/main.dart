import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(color: Colors.white),
          ),

          Container(
            height: 400,
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(color: Colors.green),
                ),
              ),

              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(color: Colors.pink),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(color: Colors.black),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(color: Colors.black),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(color: Colors.black),
              ),
            ],
          ),
          Container(height: 20),
          Expanded(
            child: Container(decoration: BoxDecoration(color: Colors.pink)),
          ),
        ],
      ),
    ),
  );
}
