import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transaction_manager/constant.dart';
import 'package:transaction_manager/main.dart';
import 'package:transaction_manager/models/transaction.dart';
import 'package:transaction_manager/screens/new_transaction_screen.dart';
import 'package:transaction_manager/widgets/home/empty_transaction.dart';
import 'package:transaction_manager/widgets/home/header.dart';
import 'package:transaction_manager/widgets/home/transactions_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static List<Transaction> transactions = [];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    App.getDate();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: kPrupleColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => const NewTransaction())).then((value) {
            App.getDate();
            setState(() {});
          });
        },
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [Header(), getBody()],
        ),
      ),
    ));
  }

  Widget getBody() => HomeScreen.transactions.isNotEmpty
      ? TransactionList(
          transactions: HomeScreen.transactions,
          onItemRemoved: (index) {
            var box = Hive.box<Transaction>(transactionsBox);
            box.deleteAt(index);
            App.getDate();
            setState(() {});
          },
          onItemUpdated: () {
            App.getDate();
            setState(() {});
          },
        )
      : const EmptyTransaction();
}
