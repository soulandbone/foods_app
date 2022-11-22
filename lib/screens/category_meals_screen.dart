import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals_screen';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
//this is the screen that opens after the user has clicked on one of the categories in the GridView

  late String title;
  late List<Meal> _displayedMeal;
  var _firstTimeLoading = true;

  void _removeMeal(mealId) {
    setState(() {
      _displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (_firstTimeLoading) {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      _displayedMeal = DUMMY_MEALS.where((element) {
        return element.categories.contains(arguments['id']);
      }).toList(); //generates a new list from DUMMY_MEALS where the element has the selected category as one of the elements in the categories the food belongs to.  This list then only has the meals that belong to a particular category, so its just a matter of rendering those elements to the screen

      title = arguments['title']!;
      _firstTimeLoading = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return InkWell(
            child: MealItem(
              id: _displayedMeal[index].id,
              title: _displayedMeal[index].title,
              imageURL: _displayedMeal[index].imageUrl,
              duration: _displayedMeal[index].duration,
              complexity: _displayedMeal[index].complexity,
              affordability: _displayedMeal[index].affordability,
              removeItem: _removeMeal,
            ),
          );
        }),
        itemCount: _displayedMeal.length,
      ),
    );
  }
}
