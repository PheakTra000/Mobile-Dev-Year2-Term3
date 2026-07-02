import '../models/expense.dart';

Future<List<Expense>> fetchExpenses() async {
  await Future.delayed(const Duration(seconds: 5));

  return [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Salad',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Guitar',
      amount: 22.69,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];
}
