import 'package:flutter/material.dart';

class CreateDrawerHeader extends StatelessWidget {
  const CreateDrawerHeader({
    super.key,
    this.title = "Cooking Up!",
    this.icon = Icons.fastfood_outlined,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.55),
            Theme.of(context).colorScheme.primary.withOpacity(0.9),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.primaryContainer,
                size: 50,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
