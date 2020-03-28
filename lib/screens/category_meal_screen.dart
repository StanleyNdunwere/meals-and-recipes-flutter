import 'package:flutter/material.dart';
import 'package:meal_and_recipes/Models/dummy_data.dart';
import 'package:meal_and_recipes/Models/dummy_data.dart' as prefix0;
import 'package:meal_and_recipes/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  CategoryMealsScreen() {}

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryId;

  Key key;

  String title;
  Map filters;
  bool isGlutenFree = false;
  bool isVegetarian = false;
  bool isVegan = false;
  bool isLactoseFree = false;

  List allCategories = DUMMY_MEALS;

  List filteredCategories;
  bool loadedInitData = false;

  List retrieveCategoryMealItems(List categories, categoryId, filters) {
    return categories.where((category) {
      return (category.categories.contains(categoryId) && (filters != null)
          ? category.isGlutenFree == filters["gluten"]
          : true && (filters != null)
              ? category.isVegan == filters["vegan"]
              : true && (filters != null)
                  ? category.isVegetarian == filters["vegetarian"]
                  : true && (filters != null)
                      ? category.isLactoseFree == filters["lactose"]
                      : true);
    }).toList();
  }

  void removeMeal(String mealId) {
    print("here");
    setState(() {
      filteredCategories.removeWhere((meal) {
        print("meal : ${meal.id}, mealid : $mealId");
        return meal.id == mealId;
      });
    });
  }

  @override
  void didChangeDependencies() {
    if (loadedInitData == false) {
      super.didChangeDependencies();
      final Map<String, dynamic> routeArgs =
          ModalRoute.of(context).settings.arguments;
      this.categoryId = routeArgs["id"];
      this.title = routeArgs["title"];
      this.filters = routeArgs["filters"];
      print(categoryId + "  " + title);
      filteredCategories =
          retrieveCategoryMealItems(allCategories, categoryId, filters);
      print(filteredCategories.length);
      loadedInitData = true;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    print(filteredCategories.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(filteredCategories[index], removeMeal);
          },
          itemCount: filteredCategories.length,
        ),
      ),
    );
  }
}
