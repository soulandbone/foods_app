import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Foods')),
      body: Center(
          child: Container(
        child: Text('This is the meal'),
      )),
    );
  }
}
