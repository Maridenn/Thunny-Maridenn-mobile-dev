// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------

// The form shall be composed of 2 text fields:
// -	Name of the grocery item
//-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button

import 'package:flutter/material.dart';
import '../../../models/grocery.dart';
import '../../../data/mock_grocery_data.dart';

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  final nameController = TextEditingController();
  final quanController = TextEditingController();
  String error = "";

  void addItem() {
    int? quan = int.tryParse(quanController.text);
    if (nameController.text.trim().isEmpty) {
      setState(() {
        error = "Please enter the name of the item";
      });
      return;
    }

    if (quan == null || quan <= 0) {
      setState(() {
        error = "Please enter the correct quantity";
      });
      return;
    }
    final newItem = GroceryItem(
      id: (allGroceryItems.length + 1).toString(),
      name: nameController.text,
      quantity: quan,
      category: GroceryCategory.other,
    );

    Navigator.pop(context, newItem);
  }

  Widget errorMessage() {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Text(error, style: TextStyle(color: Colors.red)),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    quanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add item")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
              maxLength: 20,
            ),
            SizedBox(height: 10),
            TextField(
              controller: quanController,
              decoration: InputDecoration(labelText: "Quantity"),
            ),
            errorMessage(),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    nameController.clear();
                    quanController.clear();
                  },
                  child: const Text("Reset"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addItem,
                  child: const Text("Add item"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
