import 'package:flutter/material.dart';
import 'ui/screens/welcome_screen.dart';
 
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  
  @override
  Widget build(context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
