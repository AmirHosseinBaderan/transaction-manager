import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transaction_manager/constant.dart';
import 'package:transaction_manager/screens/new_transaction_screen.dart';
import 'package:transaction_manager/widgets/home/empty_transaction.dart';
import 'package:transaction_manager/widgets/home/header.dart';
import 'package:transaction_manager/widgets/home/transactions_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: kPrupleColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => const NewTransaction()));
        },
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [Header(), const TransactionList()],
        ),
      ),
    ));
  }
}
