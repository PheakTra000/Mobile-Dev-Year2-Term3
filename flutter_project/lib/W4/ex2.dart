import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    required this.iconString,
    required this.iconPosition,
    required this.text,
    required this.background,
  });

  final IconData iconString;
  final String text;
  final Color background;
  final String iconPosition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // use condition to set the icon to left and right
            if (iconPosition == 'left') Icon(iconString),
            Text(text),
            if(iconPosition == 'right') Icon(iconString)
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
        appBar: AppBar(title: Text('Custom buttons')),
        body: Column(
          children: [
            Button(
              iconString: Icons.check,
              text: 'Submit',
              background: Colors.blue,
              iconPosition: 'left',
            ),
            Button(
              iconString: Icons.access_time,
              text: 'Time',
              background: Colors.green,
              iconPosition: 'right',
            ),
            Button(
              iconString: Icons.account_box,
              text: 'Account',
              background: Colors.grey,
              iconPosition: 'right',
            ),
          ],
        ),
      ),
    ),
  );
}
