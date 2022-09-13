import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:transaction_manager/constant.dart';
import 'package:transaction_manager/models/transaction.dart';
import 'package:transaction_manager/screens/home_screen.dart';
import 'package:transaction_manager/widgets/newTransaction/radio_button.dart';
import '../widgets/newTransaction/input_text.dart';
import 'package:persian_date/persian_date.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  static int groupId = 1;

  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController amoundController = TextEditingController();

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
          InputOutline(
              hint: 'توضیحات',
              controller: NewTransaction.descriptionController),
          InputOutline(
              hint: 'مبلغ',
              inputTtype: TextInputType.number,
              controller: NewTransaction.amoundController),
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
                    value: 1,
                    groupValue: NewTransaction.groupId,
                    onChanged: (value) {
                      setState(() {
                        NewTransaction.groupId = value!;
                      });
                    },
                    title: 'پرداختی'),
                RadioChose(
                    value: 2,
                    groupValue: NewTransaction.groupId,
                    onChanged: (value) {
                      setState(() {
                        NewTransaction.groupId = value!;
                      });
                    },
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
                  onPressed: () async {
                    var date = Jalali.fromDateTime(DateTime.now());

                    Transaction newTransaction = Transaction(
                        id: Random().nextInt(2500),
                        description: NewTransaction.descriptionController.text,
                        amount: int.parse(NewTransaction.amoundController.text),
                        date: date.toString(),
                        isPayed: NewTransaction.groupId == 1 ? true : false);

                    var transactionBox = Hive.box<Transaction>(transactionsBox);
                    await transactionBox.add(newTransaction);

                    NewTransaction.amoundController.text = '';
                    NewTransaction.descriptionController.text = '';
                    Navigator.pop(context);
                  },
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
