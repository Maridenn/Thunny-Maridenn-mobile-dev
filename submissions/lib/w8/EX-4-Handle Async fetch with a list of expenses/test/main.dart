import '../models/expense.dart';
import '../repository/expense_repository.dart';

void main() async {

  
  print("Fetching expense");

  List<Expense> expenses = await expenseRepository.fetchExpense();
  for (var expense in expenses){
    print("expense fetched : ${expense.title} ");

  }
}
