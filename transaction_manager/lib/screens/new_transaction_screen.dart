import 'package:flutter/material.dart';
import 'package:transaction_manager/constant.dart';

import '../widgets/newTransaction/input_text.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String _title = 'تراکنش جدید';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 20),
            child: Text(_title, style: TextStyle(fontSize: 20)),
          ),
          const InputOutline(hint: 'توضیحات'),
          const InputOutline(
            hint: 'مبلغ',
            inputTtype: TextInputType.number,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
              onPressed: () {},
              child:
                  const Text('تاریخ', style: TextStyle(color: Colors.black87)),
            ),
          )
        ],
      ),
    )));
  }
}
