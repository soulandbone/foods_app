import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  // this is the screen that shows the GridView with all its categories . The First Screen of the app
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
                .map((e) => CategoryItem(e.id, e.title, e.color))
                .toList(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20)));
  }
}
