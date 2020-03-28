import 'package:flutter/material.dart';
import 'package:meal_and_recipes/Models/dummy_data.dart';

import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  Map routeArg;

  Map filterParams = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context).settings.arguments != null) {
      routeArg = ModalRoute.of(context).settings.arguments;
      filterParams = routeArg["filters"];
      print(filterParams.toString());
    }
    Widget appBar =  AppBar(
      title: Text("Meals and Recipes!"),
    );
    return Scaffold(
      appBar: null,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            ...DUMMY_CATEGORIES.map((categoryData) {
              return CategoryItem(
                  id: categoryData.id,
                  color: categoryData.color,
                  title: categoryData.title,
                  filters: filterParams,
                  key: ValueKey(categoryData.id));
            }),
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 3,
//            mainAxisSpacing: 20,
//            crossAxisSpacing: 20,
//            childAspectRatio: 3/2
//          ),
        ),
      ),
    );
  }
}
