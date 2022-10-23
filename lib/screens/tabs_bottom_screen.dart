import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favourite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsBottomScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

  const TabsBottomScreen({Key? key, required this.favouriteMeal})
      : super(key: key);

  @override
  State<TabsBottomScreen> createState() => _TabsBottomScreen();
}

class _TabsBottomScreen extends State<TabsBottomScreen> {
  static const PAGE_KEY = "page_key";
  static const TITLE_KEY = "title_key";
  late List<Map<String, Object>> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {PAGE_KEY: const CategoriesScreen(), TITLE_KEY: 'categories'},
      {
        PAGE_KEY: FavouriteScreen(favouriteMeal: widget.favouriteMeal),
        TITLE_KEY: "My Favourite"
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex][TITLE_KEY] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedIndex][PAGE_KEY] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "cateogry"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "favourite"),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        onTap: (index) => _selectPage(index),
        currentIndex: _selectedIndex,
      ),
    );
  }
}
