import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transaction_manager/constant.dart';
import 'package:transaction_manager/db/db.dart';
import 'package:transaction_manager/models/transaction.dart';
import 'package:transaction_manager/screens/home_screen.dart';
import 'package:transaction_manager/screens/main_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>(transactionsBox);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  static getDate() {
    var box = Hive.box<Transaction>(transactionsBox);
    HomeScreen.transactions = box.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'FiraCode-Mediums'),
      debugShowCheckedModeBanner: false,
      title: 'Transaction Manager',
      home: const MainScreen(),
    );
  }
}
