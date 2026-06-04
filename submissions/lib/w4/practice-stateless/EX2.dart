import 'package:flutter/material.dart';

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;

  const ButtonType(this.color);
}

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.position = IconPosition.left,
    this.type = ButtonType.primary,
  });

  final String label;
  final IconData icon;
  final IconPosition position;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: type.color,
      ),
      // padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: position == IconPosition.left
            ? [
                Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(0,0,20,0),
                  child: Icon(icon, color: Colors.white),
                ),
                Text(label, style: TextStyle(color: Colors.white)),
              ]
            : [
                Text(label, style: TextStyle(color: Colors.white)),
                Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(20,0,0,0),
                  child: Icon(icon, color: Colors.white),
                ),
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
              CustomButton(label: "hello", icon: Icons.search),
              SizedBox(height: 10),
              CustomButton(
                label: "bye",
                icon: Icons.favorite,
                position: IconPosition.right,
                type: ButtonType.disabled,
              ),
              SizedBox(height: 10),
              CustomButton(
                label: "bye",
                icon: Icons.sailing_sharp,
                type: ButtonType.secondary,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
