import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction {
  @HiveField(0)
  int id;

  @HiveField(1)
  String description;

  @HiveField(2)
  int amount;

  @HiveField(3)
  String date;

  @HiveField(4)
  bool isPayed;

  Transaction(
      {required this.id,
      required this.description,
      required this.amount,
      required this.date,
      required this.isPayed});
}
