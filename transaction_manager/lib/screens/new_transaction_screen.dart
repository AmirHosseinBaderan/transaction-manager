import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:transaction_manager/constant.dart';
import 'package:transaction_manager/models/transaction.dart';
import 'package:transaction_manager/screens/home_screen.dart';
import 'package:transaction_manager/widgets/newTransaction/radio_button.dart';
import '../widgets/newTransaction/input_text.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  static int groupId = 1;

  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController amoundController = TextEditingController();
  static int index = -1;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String _title = 'تراکنش جدید';
  String date = 'تاریخ';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (NewTransaction.index >= 0) {
      Transaction transaction = HomeScreen.transactions[NewTransaction.index];
      _title = 'ویرایش ${transaction.description}';
      NewTransaction.amoundController.text = transaction.amount.toString();
      NewTransaction.descriptionController.text = transaction.description;
      NewTransaction.groupId = transaction.isPayed ? 1 : 2;
      date = transaction.date;
    }
  }

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
              onPressed: () async {
                Jalali? time = await showPersianDatePicker(
                    context: context,
                    initialDate: Jalali.now(),
                    firstDate: Jalali(1385, 8),
                    lastDate: Jalali(1450, 9));
                date = '${time?.year}/${time?.month}/${time?.day}';
                setState(() {});
              },
              child: Text(date, style: TextStyle(color: Colors.black87)),
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
                    Transaction transaction = Transaction(
                        id: NewTransaction.index >= 0
                            ? HomeScreen.transactions[NewTransaction.index].id
                            : Random().nextInt(2500),
                        description: NewTransaction.descriptionController.text,
                        amount: int.parse(NewTransaction.amoundController.text),
                        date: date,
                        isPayed: NewTransaction.groupId == 1 ? true : false);

                    var transactionBox = Hive.box<Transaction>(transactionsBox);
                    if (NewTransaction.index >= 0) {
                      try {
                        await transactionBox.putAt(
                            NewTransaction.index, transaction);
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      await transactionBox.add(transaction);
                    }

                    NewTransaction.amoundController.text = '';
                    NewTransaction.descriptionController.text = '';

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'مورد با موفقیت ثبت شد',
                        style: TextStyle(color: kGreenColor),
                      ),
                      duration: const Duration(seconds: 2),
                      padding: const EdgeInsets.all(25),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ));

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
