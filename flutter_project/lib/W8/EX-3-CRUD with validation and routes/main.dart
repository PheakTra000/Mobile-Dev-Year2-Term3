import 'package:flutter/material.dart';

import 'data/expenses_data.dart';
import 'ui/expenses/expenses_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesScreen(expenses: allExpenses),
    ),
  );
}
