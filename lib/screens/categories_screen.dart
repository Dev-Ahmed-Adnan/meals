import 'package:flutter/material.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/widgets/category_item.dart';
import 'package:meals/widgets/create_bottom_bar.dart';
import 'package:meals/widgets/create_drawer.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CreateDrawer(),
        bottomNavigationBar: const CreateBottomBar(currentIndex: 0),
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        // body: GridView.builder(gridDelegate: , itemBuilder: itemBuilder)
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: availableCategories
                .map(
                  (cat) => CategoryItem(categoryItem: cat),
                )
                .toList(),
          ),
        ));
  }
}
