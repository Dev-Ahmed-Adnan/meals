class Meal {
  const Meal({
    required this.id,
    required this.duration,
    required this.imageUrl,
    required this.ingredients,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.steps,
    required this.title,
    required this.categories,
  });

  final String id;
  final String title;
  final String imageUrl;
  final double duration;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> categories;

  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
}
