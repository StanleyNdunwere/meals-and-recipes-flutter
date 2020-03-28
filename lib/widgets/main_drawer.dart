import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  void openMealsList(context) {
    Navigator.of(context).pushNamed(
      "/",
    );
  }

  void openFiltersList(context) {
    Navigator.of(context).pushReplacementNamed(
      "/filter_screen",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.green,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Text(
            "Here'some cook off!",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto"),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            openMealsList(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Icon(
                      Icons.fastfood,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Text(
                      "Meal Categories",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            openFiltersList(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Icon(
                      Icons.filter,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Text(
                      "Filter Meals",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
