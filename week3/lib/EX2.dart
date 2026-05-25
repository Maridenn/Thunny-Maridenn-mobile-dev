import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(50),
        color: Colors.blue[300],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue[600],
          ),
          child: Center(
            child: Text(
              "halo, dennie is here",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
