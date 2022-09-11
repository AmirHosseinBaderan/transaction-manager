import 'package:flutter/material.dart';

class EmptyTransaction extends StatelessWidget {
  const EmptyTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        const Spacer(),
        const SizedBox(
          width: 150,
          height: 150,
          child: Image(image: AssetImage('assets/images/empty.png')),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('! تراکنشی موجود نیست'),
        const Spacer(),
      ],
    ));
  }
}
