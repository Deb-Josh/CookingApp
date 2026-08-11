import 'package:cooking/models/media_query_controller.dart';
import 'package:cooking/models/recipe.dart';
import 'package:cooking/models/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FilterByRecipeCategory extends StatefulWidget {
  const FilterByRecipeCategory({super.key, required this.onFilterChanged});

  final VoidCallback onFilterChanged;

  static List<bool> filterCategoryState = List<bool>.filled(RecipeCategorie.values.length, true);

  @override
  State<FilterByRecipeCategory> createState() => _FilterByRecipeCategoryState();
}

class _FilterByRecipeCategoryState extends State<FilterByRecipeCategory> {

  var filterCategoryState = FilterByRecipeCategory.filterCategoryState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MediaQueryController.screenWidth(context) <= 450 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceEvenly,
      children: RecipeCategorie.values.map((category) =>
        GestureDetector(
          onTap: () => setState(() {
            filterCategoryState[category.index] = !filterCategoryState[category.index];
            widget.onFilterChanged();
            Fluttertoast.showToast(
              msg: "Filtre appliqué!",
              textColor: themeController.isDark ? Colors.white : Colors.black,
              webBgColor: themeController.isDark ? "#000" : "#fff",
            );
          }),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: filterCategoryState[category.index] ? Colors.deepOrange : null,
              border: filterCategoryState[category.index] ? null : BoxBorder.all(width: 1, color: Colors.deepOrange),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(category.label, style: TextStyle(color: filterCategoryState[category.index] ? Colors.white : null)),
          ),
        )
      ).toList(),
    );
  }
}