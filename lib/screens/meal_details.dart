import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetails extends ConsumerStatefulWidget {
  const MealDetails({super.key, required this.mealItem});

  final Meal mealItem;

  @override
  ConsumerState<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  var icon = Icons.star_border;

  @override
  Widget build(BuildContext context) {
    if (ref.watch(favoritesProvider).contains(widget.mealItem)) {
      setState(() {
        icon = Icons.star;
      });
    } else {
      setState(() {
        icon = Icons.star_border;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealItem.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoritesProvider.notifier).toggleIsFavorites(widget.mealItem, context);
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
