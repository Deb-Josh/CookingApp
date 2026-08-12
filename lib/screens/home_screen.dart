import 'package:cooking/models/media_query_controller.dart';
import 'package:cooking/models/recipe.dart';
import 'package:cooking/widgets/card_recipe.dart';
import 'package:cooking/widgets/change_theme_button.dart';
import 'package:cooking/widgets/drawer_custom.dart';
import 'package:cooking/widgets/filter_by_recipe_category.dart';
import 'package:cooking/widgets/filter_by_recipe_origine.dart';
import 'package:cooking/widgets/nav_bar_custom.dart';
import 'package:cooking/widgets/search_bar_recipe.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static bool showSearchBar = true;

  // appliquer le filtre selon l'origine de la recette
  static bool applyOrigineFilter(Recipe recette){
    for (int i = 0; i < FilterByRecipeOrigine.filterOrigineState.length; i++) {
      bool enableFilter = FilterByRecipeOrigine.filterOrigineState[i];
      if(enableFilter){
        return recette.origine == RecipeOrigine.values[i];
      }
    }
    return true;
  }
  
  // appliquer le filtre selon la categorie de la recette
  static bool applyCategoryFilter(Recipe recette){
    for (int i = 0; i < FilterByRecipeCategory.filterCategoryState.length; i++) {
      bool? enableFilter = FilterByRecipeCategory.filterCategoryState[i];
      if(enableFilter){
        return recette.categorie == RecipeCategorie.values[i];
      }
    }
    return true;
  }

  // appliquer la recherche de recette
  static bool applySearchRecipe(Recipe recette){
    String? searchedRecipe = SearchBarRecipe.searchedRecipe;
    return (searchedRecipe == null || searchedRecipe.isEmpty) ? true : recette.name.toLowerCase().contains(searchedRecipe.toLowerCase());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final filteredAndSearchedRecipes = Recipe.recettes.where((recette) => HomeScreen.applyOrigineFilter(recette) && HomeScreen.applyCategoryFilter(recette) && HomeScreen.applySearchRecipe(recette)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: !MediaQueryController.isMobile(context) ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/logo1.png",
              width: 35,
              height: 35
            ),
            SizedBox(width: 10),
            Text("Cooking App"),
          ]
        ),
        centerTitle: !MediaQueryController.isMobile(context),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => setState(() => HomeScreen.showSearchBar = !HomeScreen.showSearchBar),
            icon: HomeScreen.showSearchBar ? Icon(Icons.search_off) : Icon(Icons.search),
          ),
          const ChangeThemeButton(),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () => context.go("/new-recipe"),
        icon: Icon(Icons.add),
        label: const Text("Nouvelle recette"),
      ),
      drawer: !MediaQueryController.isMobile(context) ? const DrawerCustom() : null,
      bottomNavigationBar: MediaQueryController.isMobile(context) ? NavBarCustom(currentIndex: 0) : null,

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: (MediaQueryController.isDesktop(context)) ? 
                    MediaQueryController.w(context, 50) :
                    (MediaQueryController.isTablet(context)) ? 
                    MediaQueryController.w(context, 70)
                    : MediaQueryController.w(context, 100),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              spacing: 15,
              children: [
                // Barre de recherche des recettes
                HomeScreen.showSearchBar ? SearchBarRecipe(onSearchChanged: () => setState((){})) : SizedBox(),
                // Filtre selon l'origine des recettes
                FilterByRecipeOrigine(onFilterChanged: () => setState((){})),
                // Filtre selon la catégorie de recette
                FilterByRecipeCategory(onFilterChanged: () => setState((){})),
                // Liste des recettes
                Column(
                  spacing: 3,
                  children: filteredAndSearchedRecipes.isNotEmpty ? filteredAndSearchedRecipes.map((recette) => CardRecipe(recipe: recette, fromRoute: "/"),
                  ).toList() : [
                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 20),
                      child: Text("Aucune recette trouvée!", style: TextStyle(fontSize: 20),)
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}