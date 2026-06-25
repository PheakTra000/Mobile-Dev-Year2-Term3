import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryItemTile extends StatelessWidget {
  const GroceryItemTile({super.key, required this.item});

  final GroceryItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundColor: item.category.color),
        title: Text(item.name, style: TextStyle(color: item.category.color)),
        trailing: Text('Quantity: ${item.quantity}'),
      ),
    );
  }
}
