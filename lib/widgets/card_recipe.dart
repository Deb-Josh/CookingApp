import 'package:cooking/models/media_query_controller.dart';
import 'package:cooking/models/recipe.dart';
import 'package:cooking/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardRecipe extends StatefulWidget {
  const CardRecipe({super.key, required this.recipe, required this.fromRoute, this.onFavoriteChanged});

  final Recipe recipe;
  final String fromRoute;
  final VoidCallback? onFavoriteChanged;

  @override
  State<CardRecipe> createState() => _CardRecipeState();
}

class _CardRecipeState extends State<CardRecipe> {
  @override
  Widget build(BuildContext context) {
    Recipe recette = widget.recipe;
    int idRecipe = Recipe.recettes.indexOf(recette);
    
    return GestureDetector(
      onTap: (){
        DetailScreen.fromRoute = widget.fromRoute;
        context.go("/details/$idRecipe");
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 5),
        elevation: 2,
        child: Container(
          height: 100,
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Hero(
                tag: recette.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    recette.pathImage,
                    height: MediaQueryController.h(context, 100),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(recette.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(recette.categorie.label, style: TextStyle(fontSize: 14)),
                        Text("${recette.ingredients.length} ingrédient(s)", style: TextStyle(fontStyle: FontStyle.italic, decoration: TextDecoration.underline))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => setState((){
                            recette.favorite = !recette.favorite;
                            if (widget.onFavoriteChanged != null){
                              widget.onFavoriteChanged!();
                            }
                          }),
                          icon: Icon(
                            recette.favorite ? Icons.favorite : Icons.favorite_outline,
                            color: Colors.red,
                          ),
                          tooltip: recette.favorite ? "Supprimer des favoris" : "Ajouter au favoris",
                        ),
                        (MediaQueryController.screenWidth(context)) > 360 ? FilledButton(
                          onPressed: () => context.push("/details/$idRecipe"),
                          child: Text("détails")
                        ) : SizedBox()
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}