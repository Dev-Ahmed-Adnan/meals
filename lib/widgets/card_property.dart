import 'package:flutter/material.dart';

class CardProperty extends StatelessWidget {
  const CardProperty({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.white,
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
