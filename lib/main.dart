import 'package:flutter/material.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meal app', theme: ThemeData(primaryColor: Colors.blue));
  }
}
