import "package:flutter/material.dart";
import '../widgets/meal_item.dart';
import '../models/dummy_data.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String route = "/category_meal";

  final List<Meal> availableMealList;

  const CategoryMealScreen({Key? key,required this.availableMealList}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  // final String categoryId;
  String? cateogryTitle;
  String? cateogryId;
  late List<Meal> mealList;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData) {
      final arg =
      ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, String>;
      cateogryTitle = arg["title"];
      cateogryId = arg["id"];
      mealList = widget.availableMealList.where(
            (meal) {
          return meal.categories.contains(cateogryId);
        },
      ).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeItem(String mealId) {
    print("mealId $mealList");
    setState(() {
      mealList.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cateogryTitle!)),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final meal = mealList[index];
            return MealItem(
                id: meal.id,
                title: meal.title,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                complexity: meal.complexity,
                affordability: meal.affordability);
          },
          itemCount: mealList.length,
        ),
      ),
    );
  }
}
