import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static String routeName = "/categories";
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id']!;

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: SafeArea(
            child: ListView.builder(
                itemCount: categoryMeals.length,
                itemBuilder: (ctx, index) {
                  var item = categoryMeals[index];
                  return MealItem(
                      id: item.id,
                      title: item.title,
                      imageUrl: item.imageUrl,
                      duration: item.duration,
                      complexity: item.complexity,
                      affordability: item.affordability);
                })));
  }
}
