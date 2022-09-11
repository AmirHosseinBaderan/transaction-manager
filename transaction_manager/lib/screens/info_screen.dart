import 'package:flutter/material.dart';
import 'package:transaction_manager/widgets/info/mony_info.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
                padding: EdgeInsets.only(top: 15, right: 20, left: 5),
                child: Text('مدیریت مالی'),
              ),
              const MonyInfo(
                  firstText: ' : پرادختی امروز',
                  secoundText: ' : دریافتی امروز',
                  firstValue: '0',
                  secoundValue: '0'),
              const MonyInfo(
                  firstText: ' : پرادختی این ماه',
                  secoundText: ' : دریافتی این ماه',
                  firstValue: '0',
                  secoundValue: '0'),
              const MonyInfo(
                  firstText: ' : پرادختی امسال',
                  secoundText: ' : دریافتی امسال',
                  firstValue: '0',
                  secoundValue: '0')
            ],
          )),
    ));
  }
}
