import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
            // YOUR CODE
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(10,0,10,0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("title", style: TextStyle(color: Colors.blue)),
                      SizedBox(height: 10,),
                      Text("description")
                    ],
                  ),
                ),
                IconButton(onPressed: () => {}, icon: Icon(Icons.favorite, color: Colors.pink,))
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
