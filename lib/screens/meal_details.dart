import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_and_recipes/Models/meal.dart';

class MealDetails extends StatefulWidget {
  Function addMealToFavoriteList;

  MealDetails(this.addMealToFavoriteList);

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  Color starColor = Colors.white;
  bool isFavorite = false;

  void removeMeal(context, mealId) {
    Navigator.of(context).pop(mealId);
  }

  @override
  Widget build(BuildContext context) {
    Map routeArgs = ModalRoute.of(context).settings.arguments;
    Meal meal = routeArgs["meal"];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            removeMeal(context, meal.id);
          },
          child: Icon(
            Icons.delete,
          )),
      appBar: AppBar(
//        textTheme: Theme.of(context).textTheme,
        title: Text(meal.title),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                starColor = Colors.yellow;
                isFavorite = true;
                widget.addMealToFavoriteList(meal);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.star,
                color: starColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 250,
                margin: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      meal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                margin: EdgeInsets.all(10),
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${1 + index}. ${meal.ingredients[index]}",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                  itemCount: meal.ingredients.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  "Steps",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                margin: EdgeInsets.all(10),
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${1 + index}. ${meal.steps[index]}",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                  itemCount: meal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
