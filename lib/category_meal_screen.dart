import "package:flutter/material.dart";

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

    return Scaffold(
      appBar: AppBar(title: Text(cateogryTitle!)),
      body: const Center(
        child: Text("This is center text"),
      ),
    );
  }
}
