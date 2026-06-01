import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            "Dennie is here!!!",
            style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 50),
          ),
        ),
      ),
    ),
  );
}
