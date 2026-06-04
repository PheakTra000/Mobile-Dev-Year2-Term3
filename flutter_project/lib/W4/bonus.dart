import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({
    required this.iconPath,
    required this.location,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
  });

  final String iconPath;
  final String location;
  final String minTemp;
  final String maxTemp;
  final String currentTemp;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purpleAccent,
      child:
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(radius: 50, backgroundImage: AssetImage(iconPath),  ),
                title: Text(location, style: TextStyle(fontSize: 30),),
              ),
            ],
          ),

      );
  }
  }


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: [Icon(Icons.menu)],
        ),
        body: Column(children: [
          WeatherCard(iconPath: 'assets/ex4/cloudy.png', location: 'Phnom Penh', minTemp: '10.0C', maxTemp: '30.0C', currentTemp: '12.2C'),
          WeatherCard(iconPath: 'assets/ex4/cloudy.png', location: 'Phnom Penh', minTemp: '10.0C', maxTemp: '30.0C', currentTemp: '12.2C'),
          WeatherCard(iconPath: 'assets/ex4/cloudy.png', location: 'Phnom Penh', minTemp: '10.0C', maxTemp: '30.0C', currentTemp: '12.2C'),
          WeatherCard(iconPath: 'assets/ex4/cloudy.png', location: 'Phnom Penh', minTemp: '10.0C', maxTemp: '30.0C', currentTemp: '12.2C')
        ],
      ),
      ),
    ),
  );
}
