import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_and_recipes/Models/meal.dart';

class MealItem extends StatelessWidget {
  Meal meal;
  Function removeMeal;

  MealItem(this.meal, this.removeMeal);

  String affordability(Affordability affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
      default:
        return "Expensive";
        break;
    }
  }

  String complexity(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return "Easy";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
      default:
        return "Expert";
        break;
    }
  }

  void goToMealDetailScreen(Meal meal, context) {
    Navigator.of(context).pushNamed("/meal_details", arguments: <String, Meal>{
      "meal": meal,
    }).then((result) {
      removeMeal(result);
    });
  }

  void removeMealItem(String id){

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMealDetailScreen(meal, context),
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    constraints: BoxConstraints(minWidth: 0, maxWidth: 300),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 60,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                    width: 300,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        meal.title,
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Raleway",
                            color: Colors.greenAccent,
                            decoration: TextDecoration.underline),
                        softWrap: true,
//                    overflow: TextOverflow.ellipsis,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text("${meal.duration} mins"),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text("${complexity(meal.complexity)}"),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text("${affordability(meal.affordability)}"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
