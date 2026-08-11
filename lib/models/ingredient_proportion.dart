class IngredientProportion {

  final Ingredient ingredient;
  final double quantity;

  const IngredientProportion(this.ingredient, this.quantity);

}

enum Ingredient{
  oignon("oignon", "pièce", "assets/ingredients/default_ingredient.png"),
  tomate("tomate", "pièce", "assets/ingredients/default_ingredient.png"),
  ail("ail", "gousse", "assets/ingredients/default_ingredient.png"),
  citron("citron", "pièce", "assets/ingredients/default_ingredient.png"),
  fromage("fromage", "g", "assets/ingredients/default_ingredient.png"),
  concombre("concombre", "pièce", "assets/ingredients/default_ingredient.png"),
  avocat("avocat", "pièce", "assets/ingredients/default_ingredient.png"),
  carotte("carotte", "pièce", "assets/ingredients/default_ingredient.png"),
  persil("persil", "g", "assets/ingredients/default_ingredient.png"),
  pain("pain", "tranches", "assets/ingredients/default_ingredient.png"),
  huileOlive("huile d'olive", "ml", "assets/ingredients/default_ingredient.png"),
  poivreNoir("poivre noir", "g", "assets/ingredients/default_ingredient.png"),
  sel("sel", "g", "assets/ingredients/default_ingredient.png"),
  poivron("poivron", "pièce", "assets/ingredients/default_ingredient.png"),
  riz("riz", "g", "assets/ingredients/default_ingredient.png"),
  pommeDeTerre("pomme de terre", "g", "assets/ingredients/default_ingredient.png"),
  poulet("poulet", "g", "assets/ingredients/default_ingredient.png"),
  sucre("sucre", "g", "assets/ingredients/default_ingredient.png"),
  farine("farine", "g", "assets/ingredients/default_ingredient.png"),
  oeuf("oeuf", "pièce", "assets/ingredients/default_ingredient.png"),
  beurre("beurre", "gousse", "assets/ingredients/default_ingredient.png"),
  lait("lait", "ml", "assets/ingredients/default_ingredient.png"),
  chocolat("chocolat", "g", "assets/ingredients/default_ingredient.png"),
  vanille("vanille", "gousse", "assets/ingredients/default_ingredient.png"),
  levureChimique("levure chimique", "g", "assets/ingredients/default_ingredient.png"),
  fruitsRouges("fruits rouges", "g", "assets/ingredients/default_ingredient.png"),
  noix("noix", "g", "assets/ingredients/default_ingredient.png"),
  poisson("poisson", "g", "assets/ingredients/default_ingredient.png");

  final String name;
  final String unity;
  final String ingredientImg;

  const Ingredient(this.name, this.unity, this.ingredientImg);
}