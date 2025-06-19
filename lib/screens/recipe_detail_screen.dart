import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:
            Text(recipe.title, style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Hero(
            tag: recipe.title,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                recipe.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text("📝 Description", style: _sectionTitle(context)),
          const SizedBox(height: 5),
          Text(recipe.description, style: _sectionContent(context)),
          const SizedBox(height: 20),
          Text("🧂 Ingredients", style: _sectionTitle(context)),
          const SizedBox(height: 5),
          Text(recipe.ingredients, style: _sectionContent(context)),
          const SizedBox(height: 20),
          Text("👨‍🍳 Steps", style: _sectionTitle(context)),
          const SizedBox(height: 5),
          Text(recipe.steps, style: _sectionContent(context)),
        ],
      ),
    );
  }

  TextStyle _sectionTitle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.secondary,
      );

  TextStyle _sectionContent(BuildContext context) => GoogleFonts.poppins(
        fontSize: 17,
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
}
