import 'package:flutter/material.dart';

class MealStepItem extends StatelessWidget {
  final int stepNumber;
  final String step;
  const MealStepItem({Key? key, required this.stepNumber, required this.step})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(child: Text("# $stepNumber"),) ,
          title: Text(step),
        ),
       const Divider()
      ],
    );
  }
}
