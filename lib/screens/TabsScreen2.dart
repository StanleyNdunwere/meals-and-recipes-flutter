import 'package:flutter/material.dart';
import 'package:meal_and_recipes/Models/meal.dart';
import 'package:meal_and_recipes/screens/favorites_screen.dart';
import 'package:meal_and_recipes/widgets/main_drawer.dart';

import 'category_screen.dart';

class TabsScreen2 extends StatefulWidget {
  List<Meal> favoriteMeals;
  Function removeFromFavorites;
  TabsScreen2(this.favoriteMeals, this.removeFromFavorites);

  @override
  _TabsScreen2State createState() => _TabsScreen2State();
}

class _TabsScreen2State extends State<TabsScreen2> {
  bool isGlutenFree = false;
  bool isVegetarian = false;
  bool isVegan = false;
  bool isLactoseFree = false;

  int selectedTabPosition = 0;
  List<Map<String, dynamic>> tabs;

  void switchTab(int index) {
    setState(() {
      selectedTabPosition = index;
    });
  }

  @override
  void initState() {
    tabs = [
      {
        "page": CategoryScreen(),
        "title": "Categories",
      },
      {
        "page": FavoritesScreen(widget.favoriteMeals, widget.removeFromFavorites),
        "title": "Favorites",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabs[selectedTabPosition]["title"]),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: tabs[selectedTabPosition]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: switchTab,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: selectedTabPosition,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
