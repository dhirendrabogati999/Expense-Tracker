import 'package:hive/hive.dart';

part 'cash_models.g.dart';

@HiveType(typeId: 0)

class cashModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  double amount;
  @HiveField(2)
  DateTime date;
  @HiveField(3)
  String category; // "income" or "expense"
  @HiveField(4)
  String? specificCategory; // "FOOD", "SHOP", "TRAVEL", "BILLS", etc.

  cashModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.specificCategory,
  });
}