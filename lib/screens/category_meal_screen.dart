import "package:flutter/material.dart";
import '../widgets/meal_item.dart';
import '../models/dummy_data.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String route = "/category_meal";
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealScreen(
  //     {Key? key, required this.categoryId, required this.categoryTitle})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String? cateogryTitle = arg["title"];
    String? cateogryId = arg["id"];

    List<Meal> mealList = DUMMY_MEALS.where((meal) {
     return meal.categories.contains(cateogryId);
    },).toList();

    return Scaffold(
      appBar: AppBar(title: Text(cateogryTitle!)),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
           final meal = mealList[index];
            return  MealItem(title: meal.title, imageUrl: meal.imageUrl,duration: meal.duration, complexity: meal.complexity, affordability: meal.affordability);
          },
          itemCount: mealList.length,
        ),
      ),
    );
  }
}
