import 'package:flutter/material.dart';
import 'package:meal_and_recipes/Models/dummy_data.dart';
import 'package:meal_and_recipes/Models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  Function removeFromFavorites;

  FavoritesScreen(this.favoriteMeals, this.removeFromFavorites);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List allMeals;
  Color starColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    allMeals = widget.favoriteMeals;

    return Container(
        child: ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Text(
                  "${index + 1}. ${allMeals[index].title}",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      starColor = Colors.white;
                      widget.removeFromFavorites(allMeals[index]);
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: starColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: allMeals.length,
    ));
  }
}
