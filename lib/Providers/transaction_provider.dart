import 'package:cash_flow/Models/cash_models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TransactionProvider with ChangeNotifier {
  final Box<cashModel> _box = Hive.box<cashModel>('cashBox');
  
  List<cashModel> _transactions = [];

  List<cashModel> get transactions => _transactions;

  double get totalBalance => _transactions.fold(0, (sum, t) => sum + (t.category == 'income' ? t.amount : -t.amount));

  double get totalIncome => _transactions.where((t) => t.category == 'income').fold(0, (sum, t) => sum + t.amount);

  double get totalExpense => _transactions.where((t) => t.category == 'expense').fold(0, (sum, t) => sum + t.amount);

  TransactionProvider() {
    loadTransactions();
  }

  void loadTransactions() {
    _transactions = _box.values.toList();
    notifyListeners();
  }

  void addTransaction(cashModel transaction) {
    _box.add(transaction);
    _transactions.add(transaction);
    notifyListeners();
  }
}