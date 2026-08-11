import 'package:flutter/material.dart';

class ShowSearchRecipeButton extends StatefulWidget {
  const ShowSearchRecipeButton({super.key});

  @override
  State<ShowSearchRecipeButton> createState() => _ShowSearchRecipeButtonState();
}

class _ShowSearchRecipeButtonState extends State<ShowSearchRecipeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() => showSearchBar = !showSearchBar),
      icon: showSearchBar ? Icon(Icons.search_off) : Icon(Icons.search),
    );
  }
}

bool showSearchBar = false;