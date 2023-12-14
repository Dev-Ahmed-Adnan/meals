import 'package:flutter/material.dart';
import 'package:meals/models/filter_model.dart';
import 'package:meals/models/meal.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Meal> favoritesList = [];

  List<FilterModel> activeFilters = [];

  bool isGlutenFreeFilter = false;
  bool isVeganFilter = false;
  bool isVegetarianFilter = false;
  bool isLactoseFreeFilter = false;

  void addToFavorites(Meal item) {
    favoritesList.add(item);
    notifyListeners();
  }

  void removeToFavorites(Meal item) {
    favoritesList.remove(item);
    notifyListeners();
  }

  void addFilter(FilterModel filter) {
    activeFilters.add(filter);
    notifyListeners();
  }

  void removeFilter(FilterModel filter) {
    activeFilters.remove(filter);
    notifyListeners();
  }

  void isGlutenFreeFilterTriger() {
    isGlutenFreeFilter = !isGlutenFreeFilter;
    notifyListeners();
  }

  void isVeganFilterTriger() {
    isVeganFilter = !isVeganFilter;
    notifyListeners();
  }

  void isVegetarianFilterTriger() {
    isVegetarianFilter = !isVegetarianFilter;
    notifyListeners();
  }

  void isLactoseFreeFilterTriger() {
    isLactoseFreeFilter = !isLactoseFreeFilter;
    notifyListeners();
  }
}
