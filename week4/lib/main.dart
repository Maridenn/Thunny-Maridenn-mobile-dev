import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100),
            SizedBox(height: 400, child: Container(color: Colors.blue[900])),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.green)),
                  SizedBox(
                    width: 100,
                    child: Container(color: Colors.pink[700]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.lightBlue)),
                  SizedBox(width: 20),
                  Expanded(child: Container(color: Colors.lightBlue)),
                  SizedBox(width: 20),
                  Expanded(child: Container(color: Colors.lightBlue)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: Container(color: Colors.pink[700])),
          ],
        ),
      ),
    ),
  );
}
