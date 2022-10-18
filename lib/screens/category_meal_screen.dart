import "package:flutter/material.dart";
import '../widgets/meal_item.dart';
import '../models/dummy_data.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String route = "/category_meal";

  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  // final String categoryId;

  @override
  void initState() {
    final arg =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String? cateogryTitle = arg["title"];
    String? cateogryId = arg["id"];

    List<Meal> mealList = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(cateogryId);
    },).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cateogryTitle!)),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
           final meal = mealList[index];
            return  MealItem(id: meal.id,title: meal.title, imageUrl: meal.imageUrl,duration: meal.duration, complexity: meal.complexity, affordability: meal.affordability);
          },
          itemCount: mealList.length,
        ),
      ),
    );
  }

}
