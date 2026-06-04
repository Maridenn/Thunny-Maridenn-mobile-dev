import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AppScreen()));
}

const String dice1Path = "assets/dices/dice-1.png";
const String dice4Path = "assets/dices/dice-4.png";

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  String activeDice = dice1Path;
  void onTap() {
    setState(() {
      activeDice = dice4Path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(activeDice, width: 300),
              SizedBox(height: 20),
              TextButton(
                onPressed: onTap,
                child: Text(
                  "change",
                  style: TextStyle(color: Colors.white, fontSize: 60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
