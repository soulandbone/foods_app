import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category_meals_screen';

//this is the screen that opens after the user has clicked on one of the categories in the GridView

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final mealCategoryFiltered = DUMMY_MEALS.where((element) {
      return element.categories.contains(arguments['id']);
    }).toList(); //generates a new list from DUMMY_MEALS where the element has the selected category as one of the elements in the categories the food belongs to.  This list then only has the meals that belong to a particular category, so its just a matter of rendering those elements to the screen

    final title = arguments['title'];

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return InkWell(
            child: MealItem(
                id: mealCategoryFiltered[index].id,
                title: mealCategoryFiltered[index].title,
                imageURL: mealCategoryFiltered[index].imageUrl,
                duration: mealCategoryFiltered[index].duration,
                complexity: mealCategoryFiltered[index].complexity,
                affordability: mealCategoryFiltered[index].affordability),
          );
        }),
        itemCount: mealCategoryFiltered.length,
      ),
    );
  }
}
