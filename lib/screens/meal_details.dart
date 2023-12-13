import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.mealItem});

  final Meal mealItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(mealItem.imageUrl),
            const SizedBox(height: 20),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color.fromARGB(255, 222, 90, 81),
                  ),
            ),
            ...mealItem.ingredients.map((ing) => Text(
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
            ...mealItem.steps.map(
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
