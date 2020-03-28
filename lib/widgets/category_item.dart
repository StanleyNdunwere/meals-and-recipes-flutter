import 'package:flutter/material.dart';
import 'package:meal_and_recipes/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  Color color;
  String title;
  Key key;
  String id;
  Map <dynamic, dynamic> filters;


  CategoryItem({
    this.key,
    @required this.id,
    @required this.color,
    @required this.title,
    this.filters
  });

  void openSelectedItem(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/category_meals_screen",
      arguments: {"id": id, "title":title, "filters" : filters},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        openSelectedItem(context);
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
              colors: ([color.withOpacity(0.7), color]),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 7.0, // has the effect of softening the shadow
              spreadRadius: 0.0, // has the effect of extending the shadow
              offset: Offset(
                2.0, // horizontal, move right 10
                2.0, // vertical, move down 10
              ),
            )
          ],
        ),
      ),
    );
  }
}
