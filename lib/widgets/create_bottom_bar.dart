import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorites.dart';

class CreateBottomBar extends StatelessWidget {
  const CreateBottomBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        index == 0 ? Navigator.push(context, MaterialPageRoute(builder: (ctx) => const CategoriesPage())) : Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Favorites()));
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "Favorites",
        ),
      ],
    );
  }
}
