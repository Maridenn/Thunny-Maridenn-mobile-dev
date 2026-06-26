import '../models/expense.dart';

class ExpenseRepository {
  List<Expense> expenses = [
    Expense(amount: 45, title: "fake"),
    Expense(amount: 95, title: "cake"),
    Expense(amount: 1009, title: "bike"),
    Expense(amount: 233, title: "mike"),
  ];

  Future<List<Expense>> fetchExpense() {
    // Simulate 5 seconds before returnning the success fetch
    return Future.delayed(Duration(seconds: 5), () {
      return expenses;
    });
  }
}

class ExpenseException implements Exception {
  final String message;
  ExpenseException(this.message);

  @override
  String toString() => message;
}

final ExpenseRepository expenseRepository =
    ExpenseRepository(); // global access for now
