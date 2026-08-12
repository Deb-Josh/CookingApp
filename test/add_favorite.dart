import 'package:cooking/models/recipe.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("Ajouter une recette en favoris", (){
    // recuperer une recette existante
    Recipe recette = Recipe.recettes[0];

    // Verifier s'il n'est deja en favoris
    expect(recette.favorite, false);

    // Mettre la recette en favoris
    recette.favorite = true;

    // Verifier que la recette est bien en favoris
    expect(recette.favorite, true);
  });

}