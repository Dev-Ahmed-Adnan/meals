import 'package:flutter/material.dart';
import 'package:meals/helpers/show_snack_bar.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/store/favorites_provider.dart';
import 'package:provider/provider.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({super.key, required this.mealItem});

  final Meal mealItem;

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  var icon = Icons.star_border;

  @override
  Widget build(BuildContext context) {
    if (Provider.of<FavoriteProvider>(context, listen: true).favoritesList.contains(widget.mealItem)) {
      icon = Icons.star;
    } else {
      icon = Icons.star_border;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealItem.title),
        actions: [
          IconButton(
            onPressed: () {
              if (Provider.of<FavoriteProvider>(context, listen: false).favoritesList.contains(widget.mealItem)) {
                Provider.of<FavoriteProvider>(context, listen: false).removeToFavorites(widget.mealItem);
                showSnackBar(context, "Meal removed from favorites list!");
              } else {
                Provider.of<FavoriteProvider>(context, listen: false).addToFavorites(widget.mealItem);
                showSnackBar(context, "Meal added to favorites list!");
              }
              // Provider.of<FavoriteProvider>(context, listen: false).favoritesList.contains(widget.mealItem) ? print("yes") : print("no");
            },
            icon: Icon(icon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(widget.mealItem.imageUrl),
            const SizedBox(height: 20),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color.fromARGB(255, 222, 90, 81),
                  ),
            ),
            ...widget.mealItem.ingredients.map((ing) => Text(
                  ing,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.orange),
                )),
            const SizedBox(height: 20),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color.fromARGB(255, 222, 90, 81),
                  ),
            ),
            ...widget.mealItem.steps.map(
              (step) => Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
