import 'package:flutter/material.dart';

class ByeScreen extends StatefulWidget {
  const ByeScreen({super.key});

  @override
  State<ByeScreen> createState() => _ByeScreenState();
}

class _ByeScreenState extends State<ByeScreen> {
  void changeScreen() {
    Navigator.pop(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff16C062), Color(0xff00BCDC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.waving_hand,
                  size: 120,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Bye bye !",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                onPressed: changeScreen,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.white),
                ),
                child: const Text(
                  'go back to convert',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
