import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recepies")),
      body: SafeArea(
          child: Center(
        child: Text("CategoryMealsScreen"),
      )),
    );
  }
}