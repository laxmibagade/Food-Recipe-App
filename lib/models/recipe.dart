class Recipe {
  final String title;
  final String description;
  final String ingredients;
  final String steps;
  final String imageUrl; // New field

  Recipe({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.imageUrl,
  });
}
