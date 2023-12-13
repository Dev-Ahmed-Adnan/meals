import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTilePress,
  });

  final String title;
  final IconData icon;
  final void Function() onTilePress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTilePress,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.background,
              ),
        ),
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
