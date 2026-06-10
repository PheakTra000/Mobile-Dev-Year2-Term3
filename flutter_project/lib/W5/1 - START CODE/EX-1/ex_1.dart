import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SelectButtonState();
  }
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;

  String get label => isSelected ? 'Selected' : "Not Selected";

  Color get textColor => isSelected ? Colors.white : Colors.black;

  Color get backgroundColor =>
      isSelected ? Colors.blue.shade500 : Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () => {
          setState(() {
            isSelected = !isSelected;
          }),
        },
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Center(child: Text(label, style: TextStyle(color: textColor),)),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SelectButton(),
            SelectButton(),
            SelectButton(),
            SelectButton(),
          ],
        ),
      ),
    ),
  ),
);
