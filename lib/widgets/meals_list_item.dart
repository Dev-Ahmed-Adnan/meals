import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/card_property.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    super.key,
    required this.mealsItems,
    required this.index,
    this.onItemPress,
  });

  final List<Meal> mealsItems;
  final int index;
  final void Function(Meal)? onItemPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemPress?.call(mealsItems[index]);
      },
      child: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(mealsItems[index].imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: const Color.fromARGB(137, 27, 27, 27),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mealsItems[index].title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardProperty(
                        title: "${mealsItems[index].duration.toString()} mins",
                        icon: Icons.access_time,
                      ),
                      const SizedBox(width: 16),
                      const CardProperty(
                        title: "Simple",
                        icon: Icons.business_center,
                      ),
                      const SizedBox(width: 16),
                      const CardProperty(
                        title: "Affordable",
                        icon: Icons.attach_money_outlined,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
