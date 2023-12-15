import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meals_list_item.dart';

class MealsList extends ConsumerStatefulWidget {
  final Category mealCategory;

  MealsList({super.key, required this.mealCategory})
      : mealsItems = dummyMeals
            .where(
              (element) => element.categories.contains(mealCategory.id),
            )
            .toList();

  late final List<Meal> mealsItems;

  @override
  ConsumerState<MealsList> createState() => _MealsListState();
}

class _MealsListState extends ConsumerState<MealsList> {
  @override
  Widget build(BuildContext context) {
    List<Meal> filteredMealItems = widget.mealsItems;

    if (ref.watch(filterProvider)["isGlutenFree"] == true) {
      filteredMealItems = filteredMealItems.where((element) => element.isGlutenFree).toList();
    }
    if (ref.watch(filterProvider)["isLactoseFree"] == true) {
      filteredMealItems = filteredMealItems.where((element) => element.isLactoseFree).toList();
    }
    if (ref.watch(filterProvider)["isVegetarian"] == true) {
      filteredMealItems = filteredMealItems.where((element) => element.isVegan).toList();
    }
    if (ref.watch(filterProvider)["isVegan"] == true) {
      filteredMealItems = filteredMealItems.where((element) => element.isVegetarian).toList();
    }

    return Scaffold(
        appBar: AppBar(title: Text(widget.mealCategory.title)),
        body: filteredMealItems.isNotEmpty
            ? ListView.builder(
                // itemCount: widget.mealsItems.length,
                itemCount: filteredMealItems.length,
                itemBuilder: (ctx, index) => MealListItem(
                  mealsItems: filteredMealItems,
                  // mealsItems: widget.mealsItems,
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
              )
            : Center(
                child: Text(
                  "No Items Found!",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ));
  }
}
