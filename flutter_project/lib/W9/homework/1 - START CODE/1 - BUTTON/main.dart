import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ButtonStatus {
  final String name;
  final bool isCompleted;

  const ButtonStatus({required this.name, required this.isCompleted});
}

class ButtonStatusDto {
  static ButtonStatus fromJson(Map<String, dynamic> json) {
    return ButtonStatus(
      name: json['name'],
      isCompleted: json['isCompleted'],
    );
  }
}

class ButtonStatusRepository {
  static final ButtonStatusRepository instance = ButtonStatusRepository();

  Future<ButtonStatus> getButtonStatus() async {
    Uri url = Uri.parse(
      "https://mobile-dev-214b4-default-rtdb.asia-southeast1.firebasedatabase.app/buttonStatus.json",
    );

    http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch button status');
    }

    Map<String, dynamic> json = convert.jsonDecode(response.body);
    return ButtonStatusDto.fromJson(json);
  }

  Future<void> updateCompleted(bool completed) async {
    Uri url = Uri.parse(
      "https://mobile-dev-214b4-default-rtdb.asia-southeast1.firebasedatabase.app/buttonStatus.json",
    );

    await http.patch(url, body: convert.jsonEncode({"isCompleted": completed}));
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ButtonStatusRepository repo = ButtonStatusRepository.instance;

  ButtonStatus? buttonStatus;

  @override
  void initState() {
    super.initState();
    fetchButtonData();
  }

  void fetchButtonData() async {
    final status = await repo.getButtonStatus();
    setState(() {
      buttonStatus = status;
    });
  }

  void _toggleCompleted() async {
    final newValue = !buttonStatus!.isCompleted;

    setState(() {
      buttonStatus = ButtonStatus(name: buttonStatus!.name, isCompleted: newValue);
    });

    await repo.updateCompleted(newValue);
  }

  @override
  Widget build(BuildContext context) {
    if (buttonStatus == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: _toggleCompleted,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonStatus!.isCompleted ? Colors.green : null,
          ),
          child: Text(buttonStatus!.name),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: App(),
    ),
  );
}