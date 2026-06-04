import 'package:flutter/material.dart';

class GetCard extends StatelessWidget {
  GetCard({
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });
  final String iconPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Image.asset(iconPath),
        title: Text(title, style: TextStyle(fontSize: 30),),
        subtitle: Text(subtitle),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Products',
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        ),
        backgroundColor: Colors.blue[600],
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
                children: [
                  GetCard(
                    iconPath: 'assets/ex3/dart.png',
                    title: 'Dart',
                    subtitle: 'The best object language',
                  ),
                  GetCard(
                    iconPath: 'assets/ex3/flutter.png',
                    title: 'Dart',
                    subtitle: 'The best mobile widget library',
                  ),
                  GetCard(
                    iconPath: 'assets/ex3/firebase.png',
                    title: 'Dart',
                    subtitle: 'The best cloud database',
                  ),
                ],
              ),
          ),
        ),
      ),
  );
}
