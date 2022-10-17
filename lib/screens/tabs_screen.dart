import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

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
          body: const TabBarView(
              children: [CategoriesScreen(), FavouriteScreen()]),
        ),);
  }
}
