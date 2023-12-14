import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_page.dart';
import 'package:meals/widgets/create_drawer_header.dart';
import 'package:meals/widgets/create_drawer_tile.dart';

class CreateDrawer extends StatelessWidget {
  const CreateDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const CreateDrawerHeader(),
          DrawerTile(
              title: "Meals",
              icon: Icons.no_meals_rounded,
              onTilePress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const CategoriesPage()),
                );
              }),
          DrawerTile(
            title: "Fitlers",
            icon: Icons.settings,
            onTilePress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const FiltersPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
