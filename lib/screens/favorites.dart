import 'package:flutter/material.dart';
import 'package:meals/widgets/create_bottom_bar.dart';
import 'package:meals/widgets/create_drawer.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CreateDrawer(),
      bottomNavigationBar: const CreateBottomBar(currentIndex: 1),
      appBar: AppBar(title: const Text("Your Favorites")),
      body: const Text("Favorites"),
    );
  }
}
