import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_step_item.dart';
import '../widgets/meal_ingredient_item.dart';
import '../models/dummy_data.dart';

class MealDetailesScreen extends StatelessWidget {
  static const String route = "/meal_detailes_rout";
  final Function _toggleFavourite;
  final Function _isFavouriteMeal;

  const MealDetailesScreen(this._toggleFavourite,this._isFavouriteMeal,{Key? key}) :super(key: key);

@override
Widget build(BuildContext context) {
  final String mealId = ModalRoute
      .of(context)
      ?.settings
      .arguments as String;
  final meal = DUMMY_MEALS.firstWhere(
        (meal) => meal.id == mealId,
  );
  return Scaffold(
    appBar: AppBar(title: Text(meal.title)),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildTitle(context, "Ingredient"),
          buildContainer(
              context,
              ListView.builder(
                itemBuilder: ((context, index) {
                  return MealIngredientItem(
                      ingredient: meal.ingredients[index]);
                }),
                itemCount: meal.ingredients.length,
              )),
          buildTitle(context, "Steps"),
          buildContainer(
              context,
              ListView.builder(
                itemBuilder: ((context, index) {
                  return MealStepItem(
                      stepNumber: index + 1, step: meal.steps[index]);
                }),
                itemCount: meal.steps.length,
              ))
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(
          _isFavouriteMeal(mealId) ? Icons.star : Icons.star_border),
      onPressed: () => _toggleFavourite(mealId),
    ),
  );
}

Widget buildTitle(BuildContext context, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      text,
      style: Theme
          .of(context)
          .textTheme
          .titleMedium,
    ),
  );
}

Widget buildContainer(BuildContext context, Widget child) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child);
}}
