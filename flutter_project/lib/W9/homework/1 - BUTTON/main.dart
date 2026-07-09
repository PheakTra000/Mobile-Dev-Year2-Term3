
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ButtonStatus {
  final String title;
  final bool completed;

  ButtonStatus({required this.title, required this.completed});

  ButtonStatus withCompleted(bool newCompleted) {
    return ButtonStatus(title: title, completed: newCompleted);
  }

  static ButtonStatus fromJson(Map<String, dynamic> json) {
    assert(json["name"] is String);
    assert(json["selected"] is bool);

    String title = json["name"];
    bool completed = json["selected"];

    return ButtonStatus(title: title, completed: completed);
  }

  @override
  String toString() {
    return "button $title  - status : $completed";
  }
}
 

class ButtonStatusRepository {
  static final ButtonStatusRepository instance = ButtonStatusRepository();


  final Uri baseUri = Uri.parse("https://mobile-dev-214b4-default-rtdb.asia-southeast1.firebasedatabase.app");


  Future<ButtonStatus> getButtonStatus() async {
    final Uri url = baseUri.replace(path: "/buttonStatus.json");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      ButtonStatus result = ButtonStatus.fromJson(json);
      return result;
    } else {
      throw Exception("Cannot fetch button status");
    }
  }

  Future<void> updateCompleted(bool completed) async {
    final Uri url = baseUri.replace(path: "/buttonStatus.json");

    final patchResponse = await http.patch(
      url,
      body: jsonEncode({"selected": completed}),
    );

    if (patchResponse.statusCode != 200) {
      throw Exception("Cannot update button status");
    }
  }
}

void main() async {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ButtonStatusRepository repo = ButtonStatusRepository.instance;

  ButtonStatus? buttonStatus;
  String? error;

  @override
  void initState() {
    super.initState();

    // Fetch init state
    _fetchButtonData();
  }

  void _fetchButtonData() async {
    try {
      buttonStatus = await repo.getButtonStatus();
      setState(() {});
    } on Exception catch (e) {
      error = e.toString();
      setState(() {});
    }
  }

  void onTap() async {
    try {
      bool newCompletion = !buttonStatus!.completed;
      await repo.updateCompleted(newCompletion);

      buttonStatus = buttonStatus!.withCompleted(newCompletion);
      setState(() {});
    } on Exception catch (e) {
      error = e.toString();
      setState(() {});
    }
  }

  Widget get body {
    if (error != null) {
      return Text(error!);
    }
    if (buttonStatus != null) {
      return AppButton(buttonStatus: buttonStatus!, onTap: onTap);
    }
    return Text("No value for now");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deno Button")),
      body: Center(child: body),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.buttonStatus, required this.onTap});

  final ButtonStatus buttonStatus;
  final VoidCallback onTap;

  Color get color => buttonStatus.completed ? Colors.blue : Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(buttonStatus.title),
        ),
      ),
    );
  }
}