import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

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
        routes: {
          '/': (ctx) => const TabsScreen(),
          CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
          MealDetailScreen.routerName: (ctx) => const MealDetailScreen()
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
        },
        // home: CategoriesScreen(),
        theme: ThemeData(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(fontWeight: FontWeight.bold)),
            primaryColor: Colors.indigo,
            canvasColor: const Color.fromRGBO(255, 254, 229, 1)));
  }
}
