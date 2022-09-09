import 'package:flutter/material.dart';
import 'package:transaction_manager/constant.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: kPrupleColor,
        onPressed: () {},
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
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
                SizedBox(
                  width: 10,
                ),
                Text('تراکنش ها')
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
