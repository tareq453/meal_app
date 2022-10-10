import 'package:flutter/material.dart';
import './category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String _categoryId;
  final String _title;
  final Color _color;
  const CategoryItem(this._categoryId, this._title, this._color, {Key? key})
      : super(key: key);

  void selectCategory(BuildContext context) {
    print("item clicked");
    Navigator.of(context).pushNamed(CategoryMealScreen.route,arguments: {"id":_categoryId,"title":_title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [_color.withOpacity(0.7), _color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          _title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
