import 'package:flutter/material.dart';
import 'category_item.dart';
import './dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DeliMeals'),
        ),
        body: GridView(
            padding: EdgeInsets.all(25),
            children: DUMMY_CATEGORIES
                .map((e) => CategoryItem(e.title, e.color))
                .toList(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20)));
  }
}
