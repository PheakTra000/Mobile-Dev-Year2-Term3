import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_tile.dart';

class ExpensesScreen extends StatelessWidget {
  final List<Expense> expenses;
  final bool isLoading;
  final String errorMessage;
  final VoidCallback onRefresh;

  const ExpensesScreen({
    super.key,
    required this.expenses,
    required this.isLoading,
    required this.errorMessage,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('Expenses (Async)'),
        actions: [
          IconButton(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRefresh,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, i) => ExpenseTile(expense: expenses[i]),
      ),
    );
  }
}
