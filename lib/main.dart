import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detailes_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';
import './screens/tabs_bottom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        '/': (context) => const TabsBottomScreen(),
        CategoryMealScreen.route: (context) => const CategoryMealScreen(),
        MealDetailesScreen.route: (context) => const MealDetailesScreen(),
        FiltersScreen.route: (context) => const FiltersScreen()
      },
    );
  }
}
