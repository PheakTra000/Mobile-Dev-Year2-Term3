import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String? _errorMessage;

  void onCheckPressed() {
    final title = _titleController.text.trim();
    final amount = double.tryParse(_amountController.text.trim());

    if (title.isEmpty || amount == null || amount <= 0 || amount > 100) {
      setState(() {
        _errorMessage = 'Amount must be a number between 1 and 100.';
      });
      return;
    }

    final newExpense = Expense(
      amount: amount,
      title: title,
      category: Category.food,
      date: DateTime.now(),
    );

    Navigator.pop<Expense>(context, newExpense);
  }

  void onCancelPressed() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Expense")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Title')),
            ),

            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: _amountController,
              maxLength: 50,
              decoration: const InputDecoration(
                prefix: Text("\$"),
                label: Text('Amount'),
              ),
            ),

            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: onCancelPressed, child: Text("Cancel")),
                ElevatedButton(onPressed: onCheckPressed, child: Text("Save")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
