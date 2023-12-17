import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_page.dart';
import 'package:meals/screens/login_screen.dart';
import 'package:meals/widgets/create_drawer_header.dart';
import 'package:meals/widgets/create_drawer_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateDrawer extends StatelessWidget {
  const CreateDrawer({
    super.key,
  });

  void _handleLogout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("name");
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const LoginScreen()));
  }

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
          ),
          DrawerTile(
            title: "Logout",
            icon: Icons.logout,
            onTilePress: () {
              _handleLogout(context);
            },
          ),
        ],
      ),
    );
  }
}
