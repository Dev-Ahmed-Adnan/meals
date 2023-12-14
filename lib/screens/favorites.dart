import 'package:flutter/material.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/store/favorites_provider.dart';
import 'package:meals/widgets/create_bottom_bar.dart';
import 'package:meals/widgets/create_drawer.dart';
import 'package:meals/widgets/meals_list_item.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  Widget? favoritesList;

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<FavoriteProvider>(context, listen: true).favoritesList;

    if (items.isNotEmpty) {
      setState(() {
        favoritesList = ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, index) => MealListItem(
            index: index,
            mealsItems: items,
            onItemPress: (item) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => MealDetails(mealItem: items[index]),
                ),
              );
            },
          ),
        );
      });
    } else {
      setState(() {
        favoritesList = Center(
          child: Text(
            "No Items Added to Favorites",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        );
      });
    }

    return Scaffold(
      drawer: const CreateDrawer(),
      bottomNavigationBar: const CreateBottomBar(currentIndex: 1),
      appBar: AppBar(title: const Text("Your Favorites")),
      body: favoritesList,
    );
  }
}
