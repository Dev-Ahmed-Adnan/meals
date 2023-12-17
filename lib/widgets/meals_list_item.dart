import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/card_property.dart';
import 'package:transparent_image/transparent_image.dart';

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
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onItemPress?.call(mealsItems[index]);
        },
        child: Stack(
          children: [
            Hero(
              tag: mealsItems[index].id,
              child: FadeInImage(
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealsItems[index].imageUrl),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}
