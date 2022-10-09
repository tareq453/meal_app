import 'package:flutter/material.dart';
import 'package:meal_app/category_item.dart';

import 'models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deal Meal"),),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3/2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: DUMMY_CATEGORIES
                .map((ctg) => CategoryItem(ctg.title, ctg.color))
                .toList()),
      ),
    );
  }
}
