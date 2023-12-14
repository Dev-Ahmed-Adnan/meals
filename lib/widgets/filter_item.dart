import 'package:flutter/material.dart';
import 'package:meals/models/filter_model.dart';
import 'package:meals/store/favorites_provider.dart';
import 'package:provider/provider.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(this.item, {super.key});

  final FilterModel item;

  @override
  Widget build(BuildContext context) {
    // var activeFilters = Provider.of<FavoriteProvider>(context, listen: true).activeFilters;
    late final bool isActive;

    if (item.value == "isGlutenFree") {
      isActive = Provider.of<FavoriteProvider>(context, listen: true).isGlutenFreeFilter;
    } else if (item.value == "isLactoseFree") {
      isActive = Provider.of<FavoriteProvider>(context, listen: true).isLactoseFreeFilter;
    } else if (item.value == "isVegetarian") {
      isActive = Provider.of<FavoriteProvider>(context, listen: true).isVegetarianFilter;
    } else if (item.value == "isVegan") {
      isActive = Provider.of<FavoriteProvider>(context, listen: true).isVeganFilter;
    }

    return SwitchListTile(
      title: Text(
        item.title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
      ),
      subtitle: Text(
        item.descriptrion,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
      ),
      value: isActive,
      onChanged: (value) {
        // activeFilters.contains(item) ? Provider.of<FavoriteProvider>(context, listen: false).removeFilter(item) : Provider.of<FavoriteProvider>(context, listen: false).addFilter(item);
        switch (item.value) {
          case "isGlutenFree":
            Provider.of<FavoriteProvider>(context, listen: false).isGlutenFreeFilterTriger();
            break;
          case "isLactoseFree":
            Provider.of<FavoriteProvider>(context, listen: false).isLactoseFreeFilterTriger();
            break;
          case "isVegetarian":
            Provider.of<FavoriteProvider>(context, listen: false).isVegetarianFilterTriger();
            break;
          case "isVegan":
            Provider.of<FavoriteProvider>(context, listen: false).isVeganFilterTriger();
            break;
          default:
            return;
        }
      },
    );
  }
}
