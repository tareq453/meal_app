import 'package:flutter/material.dart';

import './models/dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/meal_detailes_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/tabs_bottom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filterMap = {
    "gluten": false,
    "lactose": false,
    "vegetarian": false,
    "vegan": false
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeal = [];

  void setFilterMap(Map<String, bool> filterMap) {
    print("setFilterMap $filterMap");
    _filterMap = filterMap;
    setState(() {
      _availableMeal = DUMMY_MEALS.where(
        (meal) {
          if (filterMap["gluten"] == true && !meal.isGlutenFree) {
            return false;
          }
          if (filterMap["lactose"] == true && !meal.isLactoseFree) {
            return false;
          }
          if (filterMap["vegetarian"] == true && !meal.isVegetarian) {
            return false;
          }
          if (filterMap["vegan"] == true && !meal.isVegan) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    print("_toggleFavourite $mealId");
    var indexOfMeal = _favouriteMeal.indexWhere((meal) => meal.id == mealId);
    print("indexOfMeal $indexOfMeal");
    if (indexOfMeal >= 0) {
      setState(() {
        _favouriteMeal.removeAt(indexOfMeal);
      });
    } else {
      setState(() {
        _favouriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavouriteMeal(String mealId){
    return _favouriteMeal.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.pink, secondary: Colors.amber),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              headlineSmall:
                  const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headlineMedium:
                  const TextStyle(color: Color.fromARGB(21, 55, 55, 1)),
              titleMedium: const TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold))),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsBottomScreen(
              favouriteMeal: _favouriteMeal,
            ),
        CategoryMealScreen.route: (context) => CategoryMealScreen(
            availableMealList: _availableMeal),
        MealDetailesScreen.route: (context) =>  MealDetailesScreen(_toggleFavourite,_isFavouriteMeal),
        FiltersScreen.route: (context) => FiltersScreen(
            filterMap: _filterMap, saveFilterHandler: setFilterMap)
      },
    );
  }
}
