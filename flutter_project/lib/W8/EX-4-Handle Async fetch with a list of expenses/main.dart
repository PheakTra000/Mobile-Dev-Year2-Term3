import 'package:flutter/material.dart';

import 'data/expenses_data.dart';
import 'models/expense.dart';
import 'ui/expenses/expenses_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Expense> expenses = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    loadExpenses();
  }

  Future<void> loadExpenses() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final result = await fetchExpenses();
      print(result);
      setState(() {
        expenses = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load expenses: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesScreen(
        expenses: expenses,
        isLoading: isLoading,
        errorMessage: errorMessage,
        onRefresh: loadExpenses,
      ),
    );
  }
}
