import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/widgets/create_bottom_bar.dart';
import 'package:meals/widgets/create_drawer.dart';
import 'package:meals/widgets/meals_list_item.dart';

class Favorites extends ConsumerStatefulWidget {
  const Favorites({super.key});

  @override
  ConsumerState<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends ConsumerState<Favorites> {
  Widget? favoritesList;

  @override
  Widget build(BuildContext context) {
    var items = ref.watch(favoritesProvider);

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
