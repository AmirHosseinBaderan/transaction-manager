import 'package:flutter/material.dart';
import 'package:transaction_manager/widgets/home/transaction_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(children: const [
        TransactionItem(
          amount: 1500,
          date: '1401/06/21',
          payed: true,
          title: 'Service',
        ),
        TransactionItem(
          amount: 2000,
          date: '1401/06/10',
          payed: false,
          title: 'Buy',
        ),
        TransactionItem(
          amount: 1500,
          date: '1401/06/21',
          payed: true,
          title: 'Service',
        ),
        TransactionItem(
          amount: 1500,
          date: '1401/06/21',
          payed: true,
          title: 'Service',
        ),
        TransactionItem(
          amount: 2000,
          date: '1401/06/21',
          payed: false,
          title: 'Buy',
        ),
      ]),
    );
  }
}
