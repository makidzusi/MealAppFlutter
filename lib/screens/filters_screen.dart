import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final void Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(
      {super.key, required this.saveFilters, required this.currentFilters});

  static String routeName = "/filters";

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;

    super.initState();
  }

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function(bool) onChange) {
    return SwitchListTile(
        value: currentValue,
        title: Text(title),
        subtitle: Text(description),
        onChanged: onChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adject your meal selection",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchTile("Gluten-free",
                    "Include oncly glute-free meals", _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _buildSwitchTile("Vegan", "Include oncly vagan meals", _vegan,
                    (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                _buildSwitchTile(
                    "Vegetarian", "Include oncly vegetarian meals", _vegetarian,
                    (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                _buildSwitchTile("Lactose-free",
                    "Include oncly lactose-free meals", _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
