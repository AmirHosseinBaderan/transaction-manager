import 'package:flutter/material.dart';

class RadioChose extends StatefulWidget {
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
  State<RadioChose> createState() => _RadioChoseState();
}

class _RadioChoseState extends State<RadioChose> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Radio(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged),
        Text(widget.title)
      ],
    );
  }
}
