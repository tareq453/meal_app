import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  const FavouriteScreen({Key? key, required this.favouriteMeal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("favouriteMeal ${favouriteMeal.length}");
    if (favouriteMeal.isEmpty) {
      return const Center(
          child:
              Text("You don't have any favourite meal yet, you can add some!"));
    } else {
      return Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final meal = favouriteMeal[index];
            return MealItem(
                id: meal.id,
                title: meal.title,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                complexity: meal.complexity,
                affordability: meal.affordability);
          },
          itemCount: favouriteMeal.length,
        ),
      );
    }
  }
}
