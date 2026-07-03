import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_tile.dart';

class ExpensesScreen extends StatefulWidget {
  final List<Expense> expenses;

  const ExpensesScreen({super.key, required this.expenses});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  
  void onAddPressed(BuildContext context) async {
    Expense? newExpense = await Navigator.push(context, MaterialPageRoute(builder: (context) => const ExpenseForm()));

    if (newExpense != null) {
     setState(() {
        widget.expenses.add(newExpense);
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => onAddPressed(context),
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: widget.expenses.length,
          itemBuilder: (context, i) => ExpenseTile(expense: widget.expenses[i]),
        ),
      ),
    );
  }
}
