import 'package:flutter/material.dart';
import 'package:meal_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({super.key, required this.title, required this.color});

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (_) {
          return const CategoryMealsScreen();
        },
        fullscreenDialog: false));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
