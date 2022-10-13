import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Deli Meals',
        theme: ThemeData(
          primaryColor: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold)),
          primarySwatch: Colors.blue,
        ),
        home: const CategoryScreen(),
        routes: {
          CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
          MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: ((context) => CategoryScreen())));
  }
}
