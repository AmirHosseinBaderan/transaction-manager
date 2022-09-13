import 'package:flutter/material.dart';
import 'package:transaction_manager/db/db.dart';
import 'package:transaction_manager/screens/main_screen.dart';

void main() {
  initDb();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'FiraCode-Mediums'),
      debugShowCheckedModeBanner: false,
      title: 'Transaction Manager',
      home: const MainScreen(),
    );
  }
}
