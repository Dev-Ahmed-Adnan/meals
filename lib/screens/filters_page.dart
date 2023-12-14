import 'package:flutter/material.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/widgets/create_drawer.dart';
import 'package:meals/widgets/filter_item.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CreateDrawer(),
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: ListView.builder(
        itemCount: filtersList.length,
        itemBuilder: (ctx, index) => FilterItem(filtersList[index]),
      ),
    );
  }
}
