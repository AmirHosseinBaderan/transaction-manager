import 'package:flutter/material.dart';

class RadioChose extends StatelessWidget {
  final int value;
  final int groupValue;
  final Function(int?) onChanged;
  final String title;

  const RadioChose(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Radio(value: value, groupValue: groupValue, onChanged: onChanged),
        Text(title)
      ],
    );
  }
}
