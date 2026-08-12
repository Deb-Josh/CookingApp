import 'package:cooking/models/recipe.dart';
import 'package:cooking/screens/home_screen.dart';
import 'package:cooking/widgets/filter_by_recipe_category.dart';
import 'package:cooking/widgets/filter_by_recipe_origine.dart';
import 'package:cooking/widgets/search_bar_recipe.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group("Filtrer et Chercher des recettes", (){
    List<Recipe> allRecipes = Recipe.recettes;

    test("Filtrer les recettes selon leur origine", (){
      // Activer le filtre des recettes africaines
      FilterByRecipeOrigine.filterOrigineState[0] = true;

      List<Recipe> africanRecipes = allRecipes.where((recette) => HomeScreen.applyOrigineFilter(recette)).toList();

      // Verifier que le filtre a marché
      expect(africanRecipes.isNotEmpty, true);
    });

    test("Filtrer les recettes selon leur categorie", (){
      // Activer le filtre des recettes qui sont des desserts
      FilterByRecipeCategory.filterCategoryState[2] = true;

      List<Recipe> dessertRecipes = allRecipes.where((recette) => HomeScreen.applyCategoryFilter(recette)).toList();

      // Verifier que le filtre a marché
      expect(dessertRecipes.isNotEmpty, true);
    });

    test("Chercher une recette", (){
      // Definir le motif de recherche de la recette
      SearchBarRecipe.searchedRecipe = "gateau";

      List<Recipe> searchedRecipes = allRecipes.where((recette) => HomeScreen.applySearchRecipe(recette)).toList();

      // Verifier que le filtre a marché
      expect(searchedRecipes.isNotEmpty, true);
    });

  });

}