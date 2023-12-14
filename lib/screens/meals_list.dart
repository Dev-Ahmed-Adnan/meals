import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/store/favorites_provider.dart';
import 'package:meals/widgets/meals_list_item.dart';
import 'package:provider/provider.dart';

class MealsList extends StatefulWidget {
  final Category mealCategory;

  MealsList({super.key, required this.mealCategory})
      : mealsItems = dummyMeals
            .where(
              (element) => element.categories.contains(mealCategory.id),
            )
            .toList();

  late final List<Meal> mealsItems;

  @override
  State<MealsList> createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  @override
  Widget build(BuildContext context) {
    List<Meal> filteredMealItems = widget.mealsItems;
    // var activeFilters = Provider.of<FavoriteProvider>(context, listen: true).activeFilters;

    // if (activeFilters.isNotEmpty) {
    //   for (var _filter in activeFilters) {
    //     widget.mealsItems.where((element) => element.'{_filter.value}' == true);
    //     //  filteredMealItems.add()
    //   }
    // }

    if (Provider.of<FavoriteProvider>(context, listen: true).isGlutenFreeFilter) {
      filteredMealItems = filteredMealItems.where((element) => element.isGlutenFree).toList();
    }
    if (Provider.of<FavoriteProvider>(context, listen: true).isLactoseFreeFilter) {
      filteredMealItems = filteredMealItems.where((element) => element.isLactoseFree).toList();
    }
    if (Provider.of<FavoriteProvider>(context, listen: true).isVeganFilter) {
      filteredMealItems = filteredMealItems.where((element) => element.isVegan).toList();
    }
    if (Provider.of<FavoriteProvider>(context, listen: true).isVegetarianFilter) {
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
