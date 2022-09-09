import 'package:flutter/material.dart';
import 'package:transaction_manager/screens/main_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transaction Manager',
      home: MainScreen(),
    );
  }
}
