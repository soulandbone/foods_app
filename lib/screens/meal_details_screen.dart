import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal_details_screen';

// this is where you see the ingredients, steps, and a picture of the  meal

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Meal')),
      body: Center(
          child: Container(
        child: Text(mealId),
      )),
    );
  }
}
