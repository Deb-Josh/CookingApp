import 'package:cooking/models/ingredient_proportion.dart';

class Recipe{
  Recipe({
    required this.name,
    String? pathImage,
    required this.origine,
    required this.categorie,
    int? host,
    required this.ingredients,
    required this.temperature,
    required this.cookingTime,
    bool? favorite,
  }): pathImage = pathImage?? "assets/recettes/default_recipe.jpg", host = host?? 4, favorite = favorite?? false;

  String name;
  String pathImage;
  RecipeOrigine origine;
  RecipeCategorie categorie;
  int host;
  List<IngredientProportion> ingredients;
  double temperature;
  double cookingTime;
  bool favorite;

  static List<Recipe> recettes = [
    Recipe(
      name: "Salade",
      pathImage: null,
      origine: RecipeOrigine.afrique,
      categorie: RecipeCategorie.starter,
      host: null,
      ingredients: [
        IngredientProportion(Ingredient.oignon, 2),
        IngredientProportion(Ingredient.tomate, 3),
        IngredientProportion(Ingredient.huileOlive, 200),
        IngredientProportion(Ingredient.fromage, 500),
        IngredientProportion(Ingredient.pain, 2),
        IngredientProportion(Ingredient.carotte, 100),
        IngredientProportion(Ingredient.fromage, 50),
      ],
      temperature: 5,
      cookingTime: 15,
      favorite: true,
    ),
    Recipe(
      name: "Gateau au chocolat",
      pathImage: null,
      origine: RecipeOrigine.europe,
      categorie: RecipeCategorie.dessert,
      host: 10,
      ingredients: [
        IngredientProportion(Ingredient.farine, 350),
        IngredientProportion(Ingredient.chocolat, 325),
        IngredientProportion(Ingredient.sucre, 100),
        IngredientProportion(Ingredient.vanille, 150),
        IngredientProportion(Ingredient.oeuf, 6),
        IngredientProportion(Ingredient.levureChimique, 70),
        IngredientProportion(Ingredient.lait, 30),
        IngredientProportion(Ingredient.beurre, 15),
      ],
      temperature: 200,
      cookingTime: 30,
      favorite: true,
    ),
    Recipe(
      name: "Sushi",
      pathImage: null,
      origine: RecipeOrigine.asie,
      categorie: RecipeCategorie.main,
      host: 6,
      ingredients: [
        IngredientProportion(Ingredient.riz, 1000),
        IngredientProportion(Ingredient.sel, 105),
        IngredientProportion(Ingredient.poisson, 475),
        IngredientProportion(Ingredient.huileOlive, 60),
        IngredientProportion(Ingredient.persil, 90),
        IngredientProportion(Ingredient.poivron, 20),
      ],
      temperature: 50,
      cookingTime: 10,
      favorite: true,
    ),
  ];

}

// enumeration des origines des recettes
enum RecipeOrigine {
  afrique("plats africains"),
  amerique("plats américains"),
  asie("plats asiatiques"),
  europe("plats européens"),
  oceanie("plats d'océanie");

  final String label;

  const RecipeOrigine(this.label);
}

// Enumeration des categories de recette
enum RecipeCategorie {
  starter("Plat d'entrée"),
  main("Plat de résistance"),
  dessert("Dessert");

  final String label;

  const RecipeCategorie(this.label);
}