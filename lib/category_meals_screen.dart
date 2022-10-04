import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  //this is the screen that opens after the user has clicked on one of the categories in the GridView

  CategoryMealsScreen();

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final mealCategoryFiltered = DUMMY_MEALS.where((element) {
      return element.categories.contains(arguments['id']);
    }).toList(); //generates a new list from DUMMY_MEALS where the element has the selected category as one of the elements in the categories the food belongs to.  This list then only has the meals that belong to a particular category, so its just a matter of rendering those elements to the screen

    print(mealCategoryFiltered.length);
    final title = arguments['title'];

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return Container(child: Text(mealCategoryFiltered[index].title));
        }),
        itemCount: mealCategoryFiltered.length,
      ),
    );
  }
}
