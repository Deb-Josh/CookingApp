import 'package:cooking/models/ingredient_proportion.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("IngredientProportion : Ajout d'un ingrédient avec sa proportion", (){
    // IngredientProportion
    IngredientProportion ingredient = IngredientProportion(
      Ingredient.avocat,
      3
    );

    // Assert
    expect(ingredient.ingredient.unity, "pièce");
  });

}