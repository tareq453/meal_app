import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favourite_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

  const TabsScreen({Key? key,required this.favouriteMeal}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Meals"),
            bottom: const TabBar(tabs: [Tab(icon: Icon(Icons.category),text : "categories"),Tab(icon: Icon(Icons.star),text: "favourite",)]),
          ),
          body: TabBarView(
              children: [const CategoriesScreen(), FavouriteScreen(favouriteMeal: widget.favouriteMeal)]),
        ),);
  }
}
