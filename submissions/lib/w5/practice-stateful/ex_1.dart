import 'package:flutter/material.dart';

enum Choice {
  selected(
    label: "Selected",
    bgColor: Color.from(alpha: 1, red: 0.129, green: 0.588, blue: 0.953),
    fgColor: Colors.white,
  ),
  notSelected(
    label: "Not Selected",
    bgColor: Color.fromRGBO(227, 242, 253, 1),
    fgColor: Colors.black,
  );

  const Choice({
    required this.label,
    required this.bgColor,
    required this.fgColor,
  });

  final String label;
  final Color bgColor;
  final Color fgColor;
}

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isSelected = false;

  String get label => isSelected ? "Selected" : "Not Selected";
  Color get bgColor => isSelected
      ? Color.from(alpha: 1, red: 0.129, green: 0.588, blue: 0.953)
      : Color.fromRGBO(227, 242, 253, 1);
  Color get fgColor => isSelected ? Colors.white : Colors.black;

  void click() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: click,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          children: [
            Button(),
            SizedBox(height: 20),
            Button(),
            SizedBox(height: 20),
            Button(),
          ],
        ),
      ),
    ),
  ),
);
