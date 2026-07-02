import 'package:flutter/material.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("Red Screen")),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("Blue Screen")),
    );
  }
}

enum AppTabs { red, green, blue }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  AppTabs selectedTab = AppTabs.red;

  Widget get content {
    switch (selectedTab) {
      case AppTabs.red:
        return const RedScreen();
      case AppTabs.green:
        return const GreenScreen();
      case AppTabs.blue:
        return const BlueScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tabs navigation")),
      body: content,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => setState(() => selectedTab = AppTabs.red),
              icon: Icon(Icons.home, color: Colors.red),
            ),
            IconButton(
              onPressed: () => setState(() => selectedTab = AppTabs.green),
              icon: Icon(Icons.home, color: Colors.green),
            ),
            IconButton(
              onPressed: () => setState(() => selectedTab = AppTabs.blue),
              icon: Icon(Icons.home, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const App()));
}
