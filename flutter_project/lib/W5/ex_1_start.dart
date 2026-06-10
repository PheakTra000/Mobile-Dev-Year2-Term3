import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

List<Widget> getColors() {
  return colors.map((e) => Text(e)).toList();
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Label("Method 1: Loop in Array", bold: true),
              // TODO
              for (var i in colors) Text(i),
              Label("Method 2: Map", bold: true),
              // TODO
              ...colors.map((e) => Text(e)),
              Label("Method 3: Dedicated Function", bold: true),
              // TODO
              ...getColors(),
            ],
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
