import 'package:cooking/models/ingredient_proportion.dart';
import 'package:cooking/models/recipe.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("Recipe : recette avec apercu(pathImage), nombre de personne(host) et (favorite) par defaut", (){
    // Recipe
    Recipe recette = Recipe(
      name: "Poulet pané",
      pathImage: null,
      origine: RecipeOrigine.europe,
      categorie: RecipeCategorie.main,
      host: null,
      ingredients: [
        IngredientProportion(Ingredient.farine, 300),
        IngredientProportion(Ingredient.poulet, 1000),
        IngredientProportion(Ingredient.huileOlive, 500),
        IngredientProportion(Ingredient.fromage, 350),
        IngredientProportion(Ingredient.pain, 4),
      ],
      temperature: 100,
      cookingTime: 15,
    );

    // Assert
    expect(recette.pathImage, "assets/recettes/default_recipe.jpg");
    expect(recette.host, 4);
    expect(recette.favorite, false);
  });

}