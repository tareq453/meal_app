import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      String title, IconData iconData, VoidCallback clickHandler) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
      onTap: clickHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Cooking up!!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile("Meal", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile("Filter", Icons.favorite, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.route);
          })
        ],
      ),
    );
  }
}
