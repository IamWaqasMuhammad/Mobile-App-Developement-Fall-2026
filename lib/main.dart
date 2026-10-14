import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile App Development Fall 2026',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent  )),
      home: const DashboardScreen(),
    );
  }
}