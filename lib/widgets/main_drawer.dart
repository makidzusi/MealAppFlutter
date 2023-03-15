import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, Icon icon, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).accentColor,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Cooking up!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          buildListTile("Meals", const Icon(Icons.restaurant), () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Settings", const Icon(Icons.settings), () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
