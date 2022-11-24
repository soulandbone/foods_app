import 'package:flutter/material.dart';
import 'package:foods_app/dummy_data.dart';

import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import 'models/meals.dart';
import 'screens/category_screen.dart';
import 'screens/filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _appliedFilters = {
    'Gluten-Free': false,
    'Lactose-Free': false,
    'Vegan': false,
    'Vegetarian': false,
  };

  List<Meal> _filteredMeal = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      _appliedFilters = filteredData;
      _filteredMeal = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _appliedFilters['Gluten-Free']!) {
          return false;
        }
        if (!meal.isLactoseFree && _appliedFilters['Lactose-Free']!) {
          return false;
        }
        if (!meal.isVegan && _appliedFilters['Vegan']!) {
          return false;
        }
        if (!meal.isVegetarian && _appliedFilters['Vegetarian']!) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
        // home: const TabsScreem(),
        routes: {
          '/': (context) => const TabsScreen(),
          CategoryMealsScreen.routeName: (context) =>
              CategoryMealsScreen(_filteredMeal),
          MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
          FiltersScreen.routeName: (context) => FiltersScreen(_setFilters),
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: ((context) => const CategoryScreen())));
  }
}
