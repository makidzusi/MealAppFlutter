import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  const FavouritesScreen({super.key, required this.favouriteMeals});

  void _removeMeal() {}

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text("No favourite meals yet..."),
      );
    }

    return ListView.builder(
        itemCount: favouriteMeals.length,
        itemBuilder: (ctx, index) {
          var item = favouriteMeals[index];
          return MealItem(
              id: item.id,
              title: item.title,
              imageUrl: item.imageUrl,
              duration: item.duration,
              complexity: item.complexity,
              affordability: item.affordability);
        });
  }
}
