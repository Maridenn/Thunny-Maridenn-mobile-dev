import 'package:flutter/material.dart';
import '../groceries/grocery_form.dart';
import '../../../data/mock_grocery_data.dart';
import '../groceries/grocery_tile.dart';
import '../../../models/grocery.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  void onCreate() async {
    // ---------------------------------------------
    // Navigate to the form screen using showModalBottomSheet
    // ---------------------------------------------

    // https://api.flutter.dev/flutter/material/showModalBottomSheet.html

    final GroceryItem? newItem = await showModalBottomSheet<GroceryItem>(
      context: context,
      builder: (BuildContext context) {
        return const GroceryForm();
      },
    );

    if (newItem != null) {
      setState(() {
        allGroceryItems.add(newItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: allGroceryItems.length,
      itemBuilder: (context, index) {
        return GroceryTile(groceryItem: allGroceryItems[index]);
      },
    );

    // ---------------------------------------------
    //  Loop on groceries with an ListView builder
    //  For each grocery items, create a GroceryTile (grocery_tile.dart)
    // ---------------------------------------------
    // https://api.flutter.dev/flutter/widgets/ListView-class.html

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
