import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryItemForm extends StatefulWidget {
  const GroceryItemForm({super.key});

  @override
  State<GroceryItemForm> createState() => _GroceryItemFormState();
}

class _GroceryItemFormState extends State<GroceryItemForm> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void onSubmit() {
    final name = _nameController.text.trim();
    final quantity = int.tryParse(_quantityController.text.trim());

    if (name.isEmpty || quantity == null || quantity <= 0) return;

    final newItem = GroceryItem(
      id: DateTime.now().toString(),
      name: name,
      quantity: quantity,
      category: GroceryCategory.vegetables,
    );
    Navigator.pop(context, newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Quantity'),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: onSubmit,
                child: const Text('Add Item'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
