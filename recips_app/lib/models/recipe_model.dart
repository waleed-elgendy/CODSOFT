class RecipeModel {
  final String title, description, image, ingredient, preparation, url;
  final int calories, carb, protein;

  RecipeModel({
    required this.title,
    required this.description,
    required this.image,
    required this.ingredient,
    required this.preparation,
    required this.url,
    required this.calories,
    required this.carb,
    required this.protein,
  });
}

