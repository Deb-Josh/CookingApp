class IngredientProportion {

  final Ingredient ingredient;
  final double quantity;

  const IngredientProportion(this.ingredient, this.quantity);

}

enum Ingredient{
  oignon("oignon", "pièce", "assets/logo.png"),
  tomate("tomate", "pièce", "assets/logo.png"),
  ail("ail", "gousse", "assets/logo.png"),
  citron("citron", "pièce", "assets/logo.png"),
  fromage("fromage", "g", "assets/logo.png"),
  concombre("concombre", "pièce", "assets/logo.png"),
  avocat("avocat", "pièce", "assets/logo.png"),
  carotte("carotte", "pièce", "assets/logo.png"),
  persil("persil", "g", "assets/logo.png"),
  pain("pain", "tranches", "assets/logo.png"),
  huileOlive("huile d'olive", "ml", "assets/logo.png"),
  poivreNoir("poivre noir", "g", "assets/logo.png"),
  sel("sel", "g", "assets/logo.png"),
  poivron("poivron", "pièce", "assets/logo.png"),
  riz("riz", "g", "assets/logo.png"),
  pommeDeTerre("pomme de terre", "g", "assets/logo.png"),
  poulet("poulet", "g", "assets/logo.png"),
  sucre("sucre", "g", "assets/logo.png"),
  farine("farine", "g", "assets/logo.png"),
  oeuf("oeuf", "pièce", "assets/logo.png"),
  beurre("beurre", "gousse", "assets/logo.png"),
  lait("lait", "ml", "assets/logo.png"),
  chocolat("chocolat", "g", "assets/logo.png"),
  vanille("vanille", "gousse", "assets/logo.png"),
  levureChimique("levure chimique", "g", "assets/logo.png"),
  fruitsRouges("fruits rouges", "g", "assets/logo.png"),
  noix("noix", "g", "assets/logo.png"),
  poisson("poisson", "g", "assets/logo.png");

  final String name;
  final String unity;
  final String ingredientImg;

  const Ingredient(this.name, this.unity, this.ingredientImg);
}