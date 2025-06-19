import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../screens/add_recipe_screen.dart';
import '../screens/recipe_detail_screen.dart';
import '../widgets/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<RecipeProvider>(context).recipes;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Indian Recipes 🇮🇳',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: recipes.isEmpty
          ? Center(
              child: Text(
                'No recipes yet! Tap the + button to add one.',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: isDark ? Colors.white54 : Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: recipes.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RecipeDetailScreen(recipe: recipes[index]),
                  ),
                ),
                child: Hero(
                  tag: recipes[index].title,
                  child: RecipeCard(recipe: recipes[index]),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepOrange,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddRecipeScreen()),
        ),
        icon: const Icon(Icons.add),
        label: Text('Add Recipe',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
