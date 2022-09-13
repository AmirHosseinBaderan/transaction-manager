import 'package:hive_flutter/hive_flutter.dart';
import 'package:transaction_manager/constant.dart';
import 'package:transaction_manager/models/transaction.dart';

void initDb() async {
  await Hive.initFlutter();
  registerBox();
}

void registerBox() async {
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>(transactionsBox);
}
