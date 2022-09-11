import 'package:flutter/material.dart';
import 'package:transaction_manager/constant.dart';
import 'package:transaction_manager/widgets/newTransaction/radio_button.dart';

import '../widgets/newTransaction/input_text.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final String _title = 'تراکنش جدید';

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
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: Text(_title, style: const TextStyle(fontSize: 20)),
          ),
          const InputOutline(hint: 'توضیحات'),
          const InputOutline(
            hint: 'مبلغ',
            inputTtype: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: OutlinedButton(
              onPressed: () {},
              child:
                  const Text('تاریخ', style: TextStyle(color: Colors.black87)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RadioChose(
                    value: 0,
                    groupValue: 10,
                    onChanged: (value) {},
                    title: 'پرداختی'),
                RadioChose(
                    value: 1,
                    groupValue: 10,
                    onChanged: (value) {},
                    title: 'دریافتی')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all(kPrupleColor)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text('ذخیره'), Icon(Icons.save)],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all(kRedColor)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text('لغو'), Icon(Icons.cancel)],
                  )),
            ),
          )
        ],
      ),
    )));
  }
}
