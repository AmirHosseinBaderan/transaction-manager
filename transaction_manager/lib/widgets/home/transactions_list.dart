import 'package:flutter/material.dart';
import 'package:transaction_manager/constant.dart';
import 'package:transaction_manager/models/transaction.dart';
import 'package:transaction_manager/screens/home_screen.dart';
import 'package:transaction_manager/widgets/home/transaction_item.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  Function(int index) onItemRemoved;
  TransactionList(
      {super.key, required this.transactions, required this.onItemRemoved});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (builder) => AlertDialog(
                              actionsAlignment: MainAxisAlignment.spaceBetween,
                              title: const Text(
                                'حذف تراکنش',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(Icons.delete),
                              content: Text(
                                  'آیا از حذف `${HomeScreen.transactions[index].description}` مطمئن هستید؟'),
                              actions: [
                                Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    kPrupleColor)),
                                        onPressed: () {
                                          onItemRemoved(index);
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('بله'),
                                            Icon(Icons.delete)
                                          ],
                                        ))),
                                Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    kRedColor)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('خیر'),
                                            Icon(Icons.cancel)
                                          ],
                                        )))
                              ],
                            ));
                  },
                  child: TransactionItem(
                    amount: transactions[index].amount,
                    date: transactions[index].date,
                    payed: transactions[index].isPayed,
                    title: transactions[index].description,
                  ));
            }));
  }
}
