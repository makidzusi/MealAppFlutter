import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/favourites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  const TabsScreen({super.key, required this.favouriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouritesScreen(
          favouriteMeals: widget.favouriteMeals,
        ),
        'title': 'Favourites'
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String),
        ),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        drawer: MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'Favourites')
            ]),
      ),
    );
  }
}
