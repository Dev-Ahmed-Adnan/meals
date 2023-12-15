import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/helpers/show_snack_bar.dart';
import 'package:meals/models/meal.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>> {
  FavoritesNotifier() : super([]);

  void toggleIsFavorites(Meal meal, BuildContext context) {
    var isFav = state.contains(meal);

    if (isFav) {
      state = state.where((element) => element.id != meal.id).toList();
      showSnackBar(context, "Meal removed from favorites list!");
    } else {
      state = [...state, meal];
      showSnackBar(context, "Meal added to favorites list!");
    }
  }

  bool getIsFav(Meal meal) {
    return state.contains(meal);
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Meal>>((ref) => FavoritesNotifier());
