import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text('No Items in the List'),
          )
        : ListView.builder(
            itemBuilder: ((context, index) {
              return InkWell(
                child: MealItem(
                  id: favoriteMeals[index].id,
                  title: favoriteMeals[index].title,
                  imageURL: favoriteMeals[index].imageUrl,
                  duration: favoriteMeals[index].duration,
                  complexity: favoriteMeals[index].complexity,
                  affordability: favoriteMeals[index].affordability,
                ),
              );
            }),
            itemCount: favoriteMeals.length,
          );
  }
}
