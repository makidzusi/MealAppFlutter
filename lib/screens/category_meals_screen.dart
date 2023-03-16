import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static String routeName = "/categories";
  final List<Meal> availableMeals;
  const CategoryMealsScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id']!;

      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: SafeArea(
            child: ListView.builder(
                itemCount: displayedMeals.length,
                itemBuilder: (ctx, index) {
                  var item = displayedMeals[index];
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
