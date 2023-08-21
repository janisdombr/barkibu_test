import 'package:barkibu_test/screens/list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
/// Main widget to run first screen
/// with list of cats

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo for Barkibu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListScreen(),
    );
  }
}
