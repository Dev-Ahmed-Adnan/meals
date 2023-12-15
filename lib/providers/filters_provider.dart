import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/filter_model.dart';

var filtersList = [
  FilterModel(
    title: "Gluten-free",
    descriptrion: "Only include gluten-free meals.",
    value: "isGlutenFree",
  ),
  FilterModel(
    title: "Lactos-free",
    descriptrion: "Only include lactose-free meals.",
    value: "isLactoseFree",
  ),
  FilterModel(
    title: "Vegetarian",
    descriptrion: 'Onyl include vegetarian meals.',
    value: "isVegetarian",
  ),
  FilterModel(
    title: "Vegan",
    descriptrion: "Only include vegan meals.",
    value: "isVegan",
  ),
];

class FiltersNotifier extends StateNotifier<Map<String, bool>> {
  FiltersNotifier()
      : super({
          "isGlutenFree": false,
          "isLactoseFree": false,
          "isVegetarian": false,
          "isVegan": false,
        });

  void setFilter(String filter, value) {
    state = {
      ...state,
      filter: value,
    };
  }
}

final filterProvider = StateNotifierProvider<FiltersNotifier, Map<String, bool>>((ref) => FiltersNotifier());
