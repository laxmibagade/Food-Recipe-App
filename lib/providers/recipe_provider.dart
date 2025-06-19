import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeProvider with ChangeNotifier {
  final List<Recipe> _recipes = [
    Recipe(
      title: "Paneer Butter Masala",
      description: "A rich and creamy tomato-based curry with paneer.",
      ingredients: "Paneer, tomatoes, cream, butter, spices",
      steps:
          "1. Sauté onions & tomatoes\n2. Add spices & blend\n3. Add paneer and simmer with cream",
      imageUrl:
          "https://www.cookwithmanali.com/wp-content/uploads/2019/05/Paneer-Butter-Masala.jpg",
    ),
    Recipe(
      title: "Masala Dosa",
      description: "A crispy South Indian crepe with spicy potato filling.",
      ingredients: "Rice, urad dal, potato, onion, mustard seeds",
      steps:
          "1. Prepare dosa batter\n2. Make potato filling\n3. Cook dosa & add filling",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQACh1yWbIwNiWJOZ-8lkt9oGkf5cdMK4DV8Q&s",
    ),
    Recipe(
      title: "Chole Bhature",
      description: "Spicy chickpea curry served with deep-fried bread.",
      ingredients: "Chickpeas, tomato, onion, ginger, flour",
      steps: "1. Cook chole with spices\n2. Prepare dough\n3. Deep-fry bhature",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxmhdxg2hJqHRit2iNKKD7cTrVe7y3CKyySg&s",
    ),
    Recipe(
      title: "Biryani",
      description: "Aromatic rice layered with spiced meat or vegetables.",
      ingredients: "Rice, meat/veggies, yogurt, spices, saffron",
      steps:
          "1. Marinate meat\n2. Partially cook rice\n3. Layer and cook on dum",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv-mW5pElUpoE8VmiYxI7L5ox4CnwLKhEkeA&s",
    ),
    Recipe(
      title: "Gulab Jamun",
      description: "Soft fried dough balls soaked in rose-flavored syrup.",
      ingredients: "Khoya, sugar, cardamom, ghee, rose water",
      steps: "1. Make dough balls\n2. Fry until golden\n3. Soak in sugar syrup",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShekhZ50PUncO4GvKKrUNgZuyUBnP93lMziw&s",
    ),
  ];

  List<Recipe> get recipes => _recipes;

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }
}
