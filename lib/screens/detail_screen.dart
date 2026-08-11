import 'dart:ui';

import 'package:cooking/extensions/string_extension.dart';
import 'package:cooking/models/media_query_controller.dart';
import 'package:cooking/models/recipe.dart';
import 'package:cooking/models/theme_controller.dart';
import 'package:cooking/widgets/change_theme_button.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key,required this.idRecipe});

  final int idRecipe;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Recipe recette = Recipe.recettes[widget.idRecipe];

    return Scaffold(
      appBar: AppBar(
        title: Text(recette.name),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          const ChangeThemeButton(),
        ],
      ),

      body: Column(
        children: [
          Container(
            width: MediaQueryController.w(context, 100),
            height: MediaQueryController.h(context, 30),
            color: Colors.white,
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Image.asset("assets/logo.png", width: MediaQueryController.w(context, 100), fit: BoxFit.fitWidth),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                Hero(
                  tag: recette.name,
                  child: Image.asset("assets/logo1.png", height: MediaQueryController.h(context, 25))
                ),
                IconButton(
                  onPressed: () => setState(() => recette.favorite = !recette.favorite),
                  icon: Icon(
                    recette.favorite ? Icons.favorite : Icons.favorite_outline,
                    color: Colors.red,
                  ),
                  style: ButtonStyle(elevation: WidgetStatePropertyAll(10), backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  tooltip: recette.favorite ? "Supprimer des favoris" : "Ajouter au favoris",
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: (MediaQueryController.isDesktop(context)) ? 
                        MediaQueryController.w(context, 50) :
                        (MediaQueryController.isTablet(context)) ? 
                        MediaQueryController.w(context, 70)
                        : MediaQueryController.w(context, 100),
                  margin: EdgeInsets.all(10),
                  // Les details de la recette
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      // Origine + Categorie de la recette
                      Row(
                        mainAxisAlignment: MediaQueryController.screenWidth(context) <= 350 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 30, color: Colors.deepOrange),
                              Text(recette.origine.name.capitalize(), style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.category, size: 30, color: Colors.deepOrange),
                              Text(recette.categorie.label, style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),)
                            ],
                          ),
                        ],
                      ),
                      // Nombre de personnes associé aux proportions des ingredients
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: themeController.isDark ? Colors.white : Colors.black, fontSize: 18),
                          children: [
                            TextSpan(text: "Proportion des ingredients pour"),
                            TextSpan(text: " ${recette.host} personne(s) ", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                            TextSpan(text: ": ")
                          ]
                        ),
                      ),
                      // Liste des ingredients
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: recette.ingredients.map((ingredient) => 
                          SizedBox(
                            width: MediaQueryController.screenWidth(context) < 300 ? double.infinity : 150,
                            child: Row(
                              spacing: 5,
                              children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.deepOrange, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset("assets/logo.png", fit: BoxFit.cover),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(ingredient.ingredient.name, overflow: TextOverflow.ellipsis, maxLines: 3,),
                                Text("${ingredient.quantity} ${ingredient.ingredient.unity != "pièce" ? ingredient.ingredient.unity : ""}")
                              ],)
                            ],)
                          ),
                        ).toList(),
                      ),
                      // Temps de cuisson + temperature de cuisson
                      Row(
                        mainAxisAlignment: MediaQueryController.screenWidth(context) <= 350 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer, size: 30, color: Colors.deepOrange),
                              Text("${recette.cookingTime} minute(s)", style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.thermostat, size: 30, color: Colors.deepOrange),
                              Text("${recette.temperature} °C", style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),)
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}