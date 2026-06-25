import 'package:flutter/material.dart';
import '../../../models/grocery.dart';
import 'grocery_item_form.dart';
import 'grocery_item_tile.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key, required this.items});

  final List<GroceryItem> items;

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  final List<GroceryItem> _items = [];

  @override
  void initState() {
    super.initState();
    _items.addAll(widget.items);
  }

  void onCreate() async {
    final newItem = await showModalBottomSheet<GroceryItem>(
      context: context,
      builder: (context) => const GroceryItemForm(),
    );
    if (newItem != null) {
      setState(() {
        _items.add(newItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_items.isNotEmpty) {
      content = ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) => GroceryItemTile(item: _items[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(onPressed: onCreate, icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}
