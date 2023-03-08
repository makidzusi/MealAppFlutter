import 'package:flutter/material.dart';
import 'package:meal_app/category_screen.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meal app',
        home: CategoriesScreen(),
        theme: ThemeData(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(fontWeight: FontWeight.bold)),
            primaryColor: Colors.indigo,
            canvasColor: const Color.fromRGBO(255, 254, 229, 1)));
  }
}
