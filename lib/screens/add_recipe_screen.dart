import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../models/recipe.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '', desc = '', ing = '', steps = '', imageUrl = '';

  void saveRecipe() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<RecipeProvider>(context, listen: false).addRecipe(
        Recipe(
          title: title,
          description: desc,
          ingredients: ing,
          steps: steps,
          imageUrl: imageUrl,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:
            Text("Add Recipe", style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildField("Title", (v) => title = v!),
              _buildField("Description", (v) => desc = v!),
              _buildField("Ingredients", (v) => ing = v!),
              _buildField("Steps", (v) => steps = v!),
              _buildField("Image URL", (v) => imageUrl = v!),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange),
                onPressed: saveRecipe,
                child: Text("Save", style: GoogleFonts.poppins()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, FormFieldSetter<String> onSaved) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) =>
            (value == null || value.isEmpty) ? 'Please enter $label' : null,
        onSaved: onSaved,
      ),
    );
  }
}
