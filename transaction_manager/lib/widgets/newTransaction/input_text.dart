import 'package:flutter/material.dart';

class InputOutline extends StatelessWidget {
  final String hint;
  final TextInputType inputTtype;
  final TextEditingController controller;

  const InputOutline(
      {super.key,
      required this.hint,
      required this.controller,
      this.inputTtype = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
            controller: controller,
            keyboardType: inputTtype,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintText: hint,
            )));
  }
}
