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
    return Container(
      height: 200,
      padding: const EdgeInsets.only(left: 20, bottom: 40),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: const Border(
          bottom: BorderSide(width: 3, color: Color.fromARGB(255, 88, 87, 87)),
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
