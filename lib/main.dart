import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatefulWidget {
  const MealApp({super.key});

  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  Map<String, bool> _filters = {
    'gluten': true,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _favouriteMeals = [];
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meal app',
        routes: {
          '/': (ctx) => TabsScreen(
                favouriteMeals: _favouriteMeals,
              ),
          FiltersScreen.routeName: (ctx) => FiltersScreen(
                currentFilters: _filters,
                saveFilters: _setFilters,
              ),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
                availableMeals: _availableMeals,
              ),
          MealDetailScreen.routerName: (ctx) => MealDetailScreen(
              toggleFavourite: _toggleFavourite,
              isMealFavourite: _isMealFavourite)
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
