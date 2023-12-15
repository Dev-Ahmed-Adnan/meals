import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/filter_model.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterItem extends ConsumerWidget {
  const FilterItem(this.item, {super.key});

  final FilterModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      title: Text(
        item.title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
      ),
      subtitle: Text(
        item.descriptrion,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
      ),
      value: ref.watch(filterProvider)[item.value] == true,
      onChanged: (value) {
        ref.read(filterProvider.notifier).setFilter(item.value, value);
      },
    );
  }
}
