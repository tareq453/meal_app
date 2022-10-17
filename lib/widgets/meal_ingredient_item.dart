import 'package:flutter/material.dart';

class MealIngredientItem extends StatelessWidget {
  final String ingredient;
  const MealIngredientItem({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(ingredient)),
    );
  }
}
