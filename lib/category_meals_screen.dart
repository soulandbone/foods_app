import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  //this is the screen that opens after the user has clicked on one of the categories in the GridView
  final String id;
  final String title;

  CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
          child: Container(
        child: Text('This is the meal'),
      )),
    );
  }
}
