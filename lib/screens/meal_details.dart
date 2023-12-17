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
  var isFav = false;

  @override
  Widget build(BuildContext context) {
    if (ref.watch(favoritesProvider).contains(widget.mealItem)) {
      setState(() {
        isFav = true;
      });
    } else {
      setState(() {
        isFav = false;
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
            // icon: Icon(icon),
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFav ? Icons.star : Icons.star_border,
                key: ValueKey(isFav),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(tag: widget.mealItem.id, child: Image.network(widget.mealItem.imageUrl)),
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
