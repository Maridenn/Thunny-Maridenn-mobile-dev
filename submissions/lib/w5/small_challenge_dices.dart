import 'dart:math';

import 'package:flutter/material.dart';

List dice = [
  'assets/dices/dice-1.png',
  'assets/dices/dice-2.png',
  'assets/dices/dice-3.png',
  'assets/dices/dice-4.png',
  'assets/dices/dice-5.png',
  'assets/dices/dice-6.png',
];
// const dice1 = 'assets/dices/dice-1.png';
// const dice2 = 'assets/dices/dice-2.png';
// const dice3 = 'assets/dices/dice-3.png';
// const dice4 = 'assets/dices/dice-4.png';
// const dice5 = 'assets/dices/dice-5.png';
// const dice6 = 'assets/dices/dice-6.png';

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: DiceRoller()),
    ),
  ),
);

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = 'assets/dices/dice-1.png';

  void rollDice() {
    setState(() {
      // int num = Random().nextInt(6) + 1;
      // activeDiceImage = 'assets/dices/dice-$num.png';
      activeDiceImage = dice[Random().nextInt(6)];
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //gesture so that it could click on the image to roll the dice
        GestureDetector(
          onTap: rollDice,
          child: Image.asset(activeDiceImage, width: 200),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
