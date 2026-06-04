import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
    required this.text,
    required this.icon,
    this.bgColor = Colors.blue,
  });

  final String text;
  final IconData icon;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: bgColor,
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Icon(icon, color: Colors.white),
          ),
          Text(text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(text: "Travelling", icon: Icons.favorite),
              SizedBox(height: 10,),
              HobbyCard(text: "Travelling", icon: Icons.search, bgColor: Colors.pink,),
            ],
          ),
        ),
      ),
    ),
  );
}
