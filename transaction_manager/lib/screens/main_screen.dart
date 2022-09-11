import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:transaction_manager/screens/home_screen.dart';
import 'package:transaction_manager/screens/info_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  Widget screen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [Icons.home, Icons.info],
          activeIndex: currentPage,
          inactiveColor: Colors.black54,
          onTap: (index) {
            if (index == 0) {
              screen = const HomeScreen();
            } else {
              screen = const InfoScreen();
            }

            setState(() {
              currentPage = index;
            });
          },
        ),
        body: screen,
      ),
    );
  }
}
