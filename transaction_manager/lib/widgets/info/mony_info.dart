import 'package:flutter/material.dart';

class MonyInfo extends StatelessWidget {
  final String firstText;
  final String secoundText;
  final String firstValue;
  final String secoundValue;

  const MonyInfo(
      {super.key,
      required this.firstText,
      required this.secoundText,
      required this.firstValue,
      required this.secoundValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Text(
            secoundValue,
            textAlign: TextAlign.right,
          )),
          Text(
            secoundText,
            textAlign: TextAlign.right,
          ),
          Expanded(
              child: Text(
            firstValue,
            textAlign: TextAlign.right,
          )),
          Text(
            firstText,
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}
