import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_and_recipes/screens/TabsScreen2.dart';
import 'package:meal_and_recipes/screens/category_meal_screen.dart';
import 'package:meal_and_recipes/screens/category_screen.dart';
import 'package:meal_and_recipes/screens/favorites_screen.dart';
import 'package:meal_and_recipes/screens/filter_screen.dart';
import 'package:meal_and_recipes/screens/meal_details.dart';
import 'package:meal_and_recipes/screens/tabs_screen.dart';

import 'Models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> favoriteMeals = [];

  void addMealToFavoriteList(Meal meal) {
    favoriteMeals.add(meal);
    print(favoriteMeals.length);
  }
  void removeFromFavorites(Meal meal){
    favoriteMeals.remove(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals And Recipes',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.orange,
        fontFamily: "Raleway",
        canvasColor: Colors.yellow.shade100,
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                fontFamily: "Raleway",
                color: Color.fromRGBO(10, 51, 51, 1),
                fontSize: 12,
              ),
              body2: TextStyle(
                fontFamily: "Raleway",
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 12,
              ),
              title: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
      ),
//      home: CategoryScreen(),
//      home: TabsScreen2(),
      routes: {
        "/": (context) => TabsScreen2(favoriteMeals, removeFromFavorites),
        "/category_meals_screen": (context) => CategoryMealsScreen(),
        "/meal_details": (context) => MealDetails(addMealToFavoriteList),
        "/filter_screen": (context) => FilterScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
      },
    );
  }
}
