import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal_details_screen';

  Widget buildTitleText(String title, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        child: child);
  }

// this is where you see the ingredients, steps, and a picture of the  meal

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitleText('Ingredients', context),
            buildContainer(ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: ((context, index) {
                  return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ));
                  ;
                }))),
            buildTitleText('Steps', context),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: ((context, index) {
                return Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '# ${index + 1}',
                      ),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider()
                ]);
              }),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
