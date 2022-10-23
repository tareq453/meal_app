import 'package:flutter/material.dart';
import '../screens/meal_detailes_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function handler;

  const MealItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability})
      : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Challeging:
        return "challeging";
      case Complexity.Hard:
        return "hard";
      case Complexity.SIMPLE:
        return "simple";
      default:
        return "UnKown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.AFFORDABLE:
        return "affordable";
      case Affordability.PRICEY:
        return "pricy";
      case Affordability.LUXURIOUS:
        return "expensive";
      default:
        return "UnKown";
    }
  }

  void showDetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailesScreen.route, arguments: id);
        // .then((value) => handler(value as String));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Text(
                        title,
                        style:
                            const TextStyle(fontSize: 26, color: Colors.white),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$duration min")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
