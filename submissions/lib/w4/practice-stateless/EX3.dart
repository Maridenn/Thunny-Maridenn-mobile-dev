import 'package:flutter/material.dart';

enum Product {
  dart(
    title: "Dart",
    description: "it is a language",
    imagePath: "assets/w4-stateless/ex3/dart.png",
  ),
  flutter(
    title: "Flutter",
    description: "it is a framework",
    imagePath: "assets/w4-stateless/ex3/flutter.png",
  ),
  firebase(
    title: "Firebase",
    description: "cloud database",
    imagePath: "assets/w4-stateless/ex3/firebase.png",
  );

  const Product({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String description;
  final String imagePath;
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset(product.imagePath, width: 200, height: 150),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(product.title, style: TextStyle(fontSize: 32)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
              child: Text(
                product.description,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
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
        body: Container(
          decoration: BoxDecoration(color: Colors.blue),
          padding: EdgeInsets.all(25),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductCard(product: Product.dart),
                ProductCard(product: Product.flutter),
                ProductCard(product: Product.firebase),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
