import 'package:flutter/material.dart';
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
          Column(
            children: [
              DrawerTile(title: "Meals", icon: Icons.no_meals_rounded, onTilePress: () {}),
              DrawerTile(title: "Fitlers", icon: Icons.settings, onTilePress: () {}),
            ],
          )
        ],
      ),
    );
  }
}
