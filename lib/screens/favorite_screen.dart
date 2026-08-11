import 'package:cooking/models/media_query_controller.dart';
import 'package:cooking/models/recipe.dart';
import 'package:cooking/widgets/card_recipe.dart';
import 'package:cooking/widgets/change_theme_button.dart';
import 'package:cooking/widgets/drawer_custom.dart';
import 'package:cooking/widgets/nav_bar_custom.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    List<Recipe> favoritesRecipes = Recipe.recettes.where((recette) => recette.favorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Mes recettes favorites"),
        centerTitle: !MediaQueryController.isMobile(context),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          const ChangeThemeButton(),
        ],
      ),
      drawer: !MediaQueryController.isMobile(context) ? const DrawerCustom() : null,
      bottomNavigationBar: MediaQueryController.isMobile(context) ? NavBarCustom(currentIndex: 1) : null,

      body: Align(
        alignment: favoritesRecipes.isEmpty ? AlignmentGeometry.center : AlignmentGeometry.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: (MediaQueryController.isDesktop(context)) ? 
                    MediaQueryController.w(context, 50) :
                    (MediaQueryController.isTablet(context)) ? 
                    MediaQueryController.w(context, 70)
                    : MediaQueryController.w(context, 100),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              spacing: 3,
              children: [
                ...favoritesRecipes.map((recette) => 
                  CardRecipe(recipe: recette, onFavoriteChanged: () => setState((){})),
                ),
                favoritesRecipes.isEmpty ?
                Column(
                  children: [
                    Image.asset("assets/logo.png", width: 150,),
                    Text(
                      "Vous n'avez aucune recette favorite pour l'instant",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ) : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}