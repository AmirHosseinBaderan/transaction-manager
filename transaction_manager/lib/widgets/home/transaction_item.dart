import 'package:flutter/material.dart';
import 'package:transaction_manager/constant.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final int amount;
  final String date;
  final bool payed;

  const TransactionItem(
      {super.key,
      required this.title,
      required this.amount,
      required this.date,
      required this.payed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: payed ? kRedColor : kGreenColor),
            child: Icon(
              payed ? Icons.remove : Icons.add,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          Column(
            children: [
              Text(
                '$amount تومان',
                style: TextStyle(
                    fontSize: 16, color: payed ? kRedColor : kGreenColor),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 14, color: kGreenColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
