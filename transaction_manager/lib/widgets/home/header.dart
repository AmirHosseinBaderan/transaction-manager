import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class Header extends StatelessWidget {
  final TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 10, left: 5),
      child: Row(children: [
        Expanded(
            child: SearchBarAnimation(
          textEditingController: searchText,
          isOriginalAnimation: false,
          buttonIcon: Icons.search,
          hintText: 'Search...',
          buttonElevation: 0,
        )),
        const SizedBox(
          width: 10,
        ),
        const Text('تراکنش ها')
      ]),
    );
  }
}
