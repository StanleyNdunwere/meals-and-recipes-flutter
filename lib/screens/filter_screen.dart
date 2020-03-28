import 'package:flutter/material.dart';
import 'package:meal_and_recipes/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  bool isGlutenFree = false;
  bool isVegetarian = false;
  bool isVegan = false;
  bool isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MainDrawer(),
      ),
      appBar: AppBar(
        title: Text("Filter The Meal Categories"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                    onChanged: (newVal) {
                      isGlutenFree = newVal;
                    },
                    value: isGlutenFree,
                    title: Text("Hide Gluten Laden Meals"),
                  ),
                  SwitchListTile(
                    onChanged: (newVal) {
                      isVegan = newVal;
                    },
                    value: isVegan,
                    title: Text("Hide non-Vegan Meals"),
                  ),
                  SwitchListTile(
                    onChanged: (newVal) {
                      isVegetarian = newVal;
                    },
                    value: isVegetarian,
                    title: Text("Hide non-Vegetarian Meals"),
                  ),
                  SwitchListTile(
                    onChanged: (newVal) {
                      isLactoseFree = newVal;
                    },
                    value: isLactoseFree,
                    title: Text("Hide Lactose Laden Meals"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: () {
                        Map<String, bool> filterParams = {
                          "gluten": isGlutenFree,
                          "lactose": isLactoseFree,
                          "vegan": isVegan,
                          "vegetarian": isVegetarian,
                        };
                        Navigator.of(context).pushReplacementNamed("/",
                            arguments: {"filters": filterParams});
                      },
                      child: Text("Apply Filters"),
                      color: Colors.green,
                      elevation: 5,
                    ),
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
