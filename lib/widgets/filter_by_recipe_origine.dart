import 'package:cooking/extensions/string_extension.dart';
import 'package:cooking/models/recipe.dart';
import 'package:cooking/models/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FilterByRecipeOrigine extends StatefulWidget {
  const FilterByRecipeOrigine({super.key, required this.onFilterChanged});

  final VoidCallback onFilterChanged;

  static List<bool> filterOrigineState = List<bool>.filled(RecipeOrigine.values.length, true);

  @override
  State<FilterByRecipeOrigine> createState() => _FilterByRecipeOrigineState();
}

class _FilterByRecipeOrigineState extends State<FilterByRecipeOrigine> {
  
  var filterOrigineState = FilterByRecipeOrigine.filterOrigineState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: RecipeOrigine.values.map((origine) => 
          GestureDetector(
            onTap: () => setState(() {
              filterOrigineState[origine.index] = !filterOrigineState[origine.index];
              widget.onFilterChanged();
              Fluttertoast.showToast(
                msg: "Filtre appliqué!",
                textColor: themeController.isDark ? Colors.white : Colors.black,
                webBgColor: themeController.isDark ? "#000" : "#fff",
              );
            }),
            child: Container(
              width: 100,
              height: 120,
              margin: origine.index != RecipeOrigine.values.length - 1 ? EdgeInsets.only(right: 10) : null,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withAlpha(filterOrigineState[origine.index] ? 150 : 100),
                borderRadius: BorderRadius.circular(10),
                border: filterOrigineState[origine.index] ? Border.all(color: Colors.deepOrange, width: 2) : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(255),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.asset(origine.origineImg, fit: BoxFit.cover)
                  ),
                  Text(origine.label.capitalizeAll(), textAlign: TextAlign.center, style: TextStyle(letterSpacing: 1, fontSize: 12, fontWeight: filterOrigineState[origine.index] ? FontWeight.bold : null),),
                ],
              ),
            ),
          ),
        ).toList(),
      )
    );
  }
}