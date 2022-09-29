import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  //this is the screen that opens after the user has clicked on one of the categories in the GridView

  CategoryMealsScreen();

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final title = arguments['title'];

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: Center(
          child: Container(
        child: Text('This is the meal'),
      )),
    );
  }
}
