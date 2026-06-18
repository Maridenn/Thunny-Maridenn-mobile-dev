import 'package:flutter/material.dart';
import '../data/jokes_data.dart';
import 'card.dart';

Color appColor = Colors.green[300] as Color;

class JokePage extends StatefulWidget {
  const JokePage({super.key});

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  int favorite = -1;

  void onFavoriteClick(int index) {
    setState(() {
      favorite = (favorite == index) ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return JokeCard(
            joke: jokes[index],
            isFavorite: favorite == index,
            onFavoriteClick: () => onFavoriteClick(index),
          );
        },
      ),
    );
  }
}
