import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals_list.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryItem,
  });

  final Category categoryItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, "/meals_list");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => MealsList(mealCategory: categoryItem),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: categoryItem.color,
        ),
        padding: const EdgeInsets.all(20),
        child: Text(
          categoryItem.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
