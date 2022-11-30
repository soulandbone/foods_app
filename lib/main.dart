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
  Map<String, bool> _currentFilters = {
    'Gluten-Free': false,
    'Lactose-Free': false,
    'Vegan': false,
    'Vegetarian': false,
  };

  List<Meal> _filteredMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleSwitch(String mealId) {
    int existingIndex = _favoriteMeals.indexWhere(
      (meal) => mealId == meal.id,
    );

    setState(() {
      if (existingIndex <
          0) // Meal does not exist in the favorite list, means we are adding it
      {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      } else // Meal exists already in the favorite list, which means we need to put it out of there
      {
        _favoriteMeals.removeAt(existingIndex);
      }

      print(_favoriteMeals);
    });
  }

  bool _isMealFavorited(mealId) {
    if (_favoriteMeals.any((meal) => meal.id == mealId)) {
      return true;
    } else {
      return false;
    }
  }

  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      _currentFilters = filteredData;
      _filteredMeal = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _currentFilters['Gluten-Free']!) {
          return false;
        }
        if (!meal.isLactoseFree && _currentFilters['Lactose-Free']!) {
          return false;
        }
        if (!meal.isVegan && _currentFilters['Vegan']!) {
          return false;
        }
        if (!meal.isVegetarian && _currentFilters['Vegetarian']!) {
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
          '/': (context) => TabsScreen(_favoriteMeals),
          CategoryMealsScreen.routeName: (context) =>
              CategoryMealsScreen(_filteredMeal),
          MealDetailsScreen.routeName: (context) =>
              MealDetailsScreen(_toggleSwitch, _isMealFavorited),
          FiltersScreen.routeName: (context) =>
              FiltersScreen(_currentFilters, _setFilters),
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: ((context) => const CategoryScreen())));
  }
}
