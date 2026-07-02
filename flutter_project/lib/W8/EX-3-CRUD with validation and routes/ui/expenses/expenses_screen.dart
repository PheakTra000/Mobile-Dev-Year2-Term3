import 'package:flutter/material.dart';

import '../../data/expenses_data.dart';
import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_tile.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  
  void onAddPressed(BuildContext context) async {
    // Expense? newExpense = await showModalBottomSheet<Expense>(
    //   isScrollControlled: true,
    //   builder: (context) => ExpenseForm(),
    //   context: context,
    // );
    Expense? newExpense = await Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseForm()));

    if (newExpense != null) {
     setState(() {
        allExpenses.add(newExpense);  // add the new expense to the list and refresh UI
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
          itemCount: allExpenses.length,
          itemBuilder: (context, i) => ExpenseTile(expense: allExpenses[i]),
        ),
      ),
    );
  }
}
