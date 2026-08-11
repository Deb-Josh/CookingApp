import 'package:flutter/material.dart';

class SearchBarRecipe extends StatefulWidget {
  const SearchBarRecipe({super.key, required this.onSearchChanged});

  final VoidCallback onSearchChanged;

  static String? searchedRecipe;

  @override
  State<SearchBarRecipe> createState() => _SearchBarRecipeState();
}

class _SearchBarRecipeState extends State<SearchBarRecipe> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: Icon(Icons.search),
      hintText: "Rechercher une recette...",
      constraints: BoxConstraints(
        minHeight: 45,
      ),
      onSubmitted: (value){
        setState(() => SearchBarRecipe.searchedRecipe = value);
        widget.onSearchChanged();
      },
    );
  }
}