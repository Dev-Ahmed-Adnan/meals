import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meals_list_item.dart';

class MealsList extends StatelessWidget {
  final Category mealCategory;

  MealsList({super.key, required this.mealCategory})
      : mealsItems = dummyMeals
            .where(
              (element) => element.categories.contains(mealCategory.id),
            )
            .toList();

  late final List<Meal> mealsItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mealCategory.title)),
      body: ListView.builder(
        itemCount: mealsItems.length,
        itemBuilder: (ctx, index) => MealListItem(
          mealsItems: mealsItems,
          index: index,
          onItemPress: (mealItem) => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => MealDetails(mealItem: mealItem),
              ),
            ),
          },
        ),
      ),
    );
  }
}
