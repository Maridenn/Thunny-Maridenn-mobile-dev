import 'package:flutter/material.dart';

List<String> images = [
  "assets/w5-stateful/bird.jpg",
  "assets/w5-stateful/bird2.jpg",
  "assets/w5-stateful/insect.jpg",
  "assets/w5-stateful/girl.jpg",
  "assets/w5-stateful/man.jpg",
];

class ImageTurner extends StatefulWidget {
  const ImageTurner({super.key});

  @override
  State<ImageTurner> createState() => _ImageTurnerState();
}

class _ImageTurnerState extends State<ImageTurner> {
  int index = 0;
  void next() {
    setState(() {
      if (index == images.length - 1) {
        index = 0;
      } else {
        index += 1;
      }
    });
  }

  void before() {
    setState(() {
      if (index == 0) {
        index = images.length - 1;
      } else {
        index -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: before,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: next,
            ),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child,),
        child: Image.asset(
          images[index],
          key: ValueKey(images[index]),
        )
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    //A: to eliminate teh debug banner that is usually on the right top side of the screen
    home: ImageTurner(),
  ),
);

// Q1: What type of state do you need to keep?   
// A: the type of state that i need to keep or use is stateful as we need to update the picture so that it could changes when clicked. 

// Q2 : Look at the current widget tree: which widget will you warp into your stateful widget?
// A: that would be the Scaffold as we need the appbar as the one to set the state and the body for changing the image.
