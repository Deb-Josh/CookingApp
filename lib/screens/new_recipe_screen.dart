import 'package:cooking/extensions/string_extension.dart';
import 'package:cooking/models/ingredient_proportion.dart';
import 'package:cooking/models/media_query_controller.dart';
import 'package:cooking/models/recipe.dart';
import 'package:cooking/widgets/change_theme_button.dart';
import 'package:cooking/widgets/ingredient_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class NewRecipeScreen extends StatefulWidget {
  const NewRecipeScreen({super.key});

  @override
  State<NewRecipeScreen> createState() => _NewRecipeScreenState();
}

class _NewRecipeScreenState extends State<NewRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _pathImage;
  RecipeOrigine? _origine;
  RecipeCategorie _categorie = RecipeCategorie.main;
  int _host = 4;
  final List<IngredientProportion> _ingredients = [];
  double? _temperature;
  double? _cookingTime;

  int indexIngredient = 0;

  List<IngredientWidget> ingredientWidgetList = [
    IngredientWidget(indexIngredient: 0),
  ];

  void _resetForm(){
    _formKey.currentState?.reset();
    setState((){
      _origine = null;
      _categorie = RecipeCategorie.main;
      _host = 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle recette"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,actions: [
          const ChangeThemeButton(),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go("/"),
        ),
      ),

      body: SingleChildScrollView( // SingleChildScrollView
        child: Center( // Center
          child: Container( // Container
            width: (MediaQueryController.isDesktop(context)) ? 
                    MediaQueryController.w(context, 50) :
                    (MediaQueryController.isTablet(context)) ? 
                    MediaQueryController.w(context, 70)
                    : MediaQueryController.w(context, 100),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Form(  // Form
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                  spacing: 15,
                  children: [
                    // const SizedBox(height: 15),
            
                    // Nom de la recette
                    TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) => (value == null || value.isEmpty) ? "Nom de recette requise!" : null,
                      onSaved: (value) => _name = value,
                      decoration: const InputDecoration(
                        labelText: "Recette",
                        prefixIcon: Icon(Icons.receipt_long_outlined),
                        hintText: "Le nom de la recette",
                        border: OutlineInputBorder(),
                      ),
                    ),
            
                    // Image d'apercu de la recette
                    TextFormField(
                      keyboardType: TextInputType.url,
                      onSaved: (value) => _pathImage = value,
                      decoration: const InputDecoration(
                        labelText: "Aperçu (facultatif)",
                        prefixIcon: Icon(Icons.image_outlined),
                        hintText: "Une photo de la recette",
                        border: OutlineInputBorder(),
                      ),
                    ),
            
                    // La recette est originaire de quel continent ?
                    DropdownButtonFormField<RecipeOrigine>(
                      initialValue: _origine,
                      isExpanded: false,
                      validator: (value) => (value == null || value.name.isEmpty) ? "Indiquez l'origine!" : null,
                      items: RecipeOrigine.values.map((origine) => 
                        DropdownMenuItem(value: origine, child: Text(origine.name.capitalize())),
                      ).toList(),
                      onSaved: (value) => _origine = value,
                      onChanged: (RecipeOrigine? newValue) {
                        if(newValue != null) {
                          setState(() => _origine = newValue);
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: "Origine",
                        prefixIcon: Icon(Icons.location_on_outlined),
                        hintText: "Le continent d'origine",
                        border: OutlineInputBorder(),
                      ),
                    ),
            
                    // Categorie a laquelle appartient la recette
                    RadioGroup<RecipeCategorie>(
                      groupValue: _categorie,
                      onChanged: (value) => setState(() => _categorie = value!),
                      child: Wrap(
                        children: RecipeCategorie.values.map((category){
                          return SizedBox(
                            width: MediaQueryController.screenWidth(context) <= 400 ? double.infinity : 180,
                            child: RadioListTile<RecipeCategorie>(
                              title: Text(category.label),
                              value: category,
                              selected: true,
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
            
                    // Nombre de personne proportionnel aux des ingredients de la recette
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Recette pour combien de personnes ?"),
                        Slider(
                          min: 4, max: 20, divisions: 8,
                          label: "$_host personnes",
                          value: _host.toDouble(),
                          activeColor: Colors.deepOrangeAccent,
                          onChanged: (value) => setState(() => _host = value.round()),
                        ),
                      ],
                    ),
          
                    // Les ingredients de la recette
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ingrédients de la recette :"),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 300,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[600]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(6),
                          child: SingleChildScrollView(
                            child: Column(
                              spacing: 6,
                              // Paire de champs Ingredient-Quantité
                              children: ingredientWidgetList,
                              // Fin paire de champs Ingredient-Quantité
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => setState(() {
                                indexIngredient++;
                                ingredientWidgetList.add(
                                  IngredientWidget(
                                    indexIngredient: indexIngredient,
                                  )
                                );
                              }),
                              child: Text("Ajouter un autre ingrédient")
                            )
                          ]
                        )
                      ],
                    ),
            
                    // Temperature de cuisson
                    TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      validator: (value) => (value == null || value.isEmpty) ? "Température requise!" : null,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r"^\d*\.?\d*")),
                      ],
                      onSaved: (value) => _temperature = double.parse(value!),
                      decoration: const InputDecoration(
                        labelText: "Temperature (°C)",
                        prefixIcon: Icon(Icons.thermostat_outlined),
                        hintText: "Temperature de cuisson",
                        border: OutlineInputBorder(),
                      ),
                    ),
            
                    // Temps de cuisson
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) => (value == null || value.isEmpty) ? "Minuterie requise!" : null,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onSaved: (value) => _cookingTime = double.parse(value!),
                      decoration: const InputDecoration(
                        labelText: "Minuterie (min)",
                        prefixIcon: Icon(Icons.timer_outlined),
                        hintText: "Temps de cuisson",
                        border: OutlineInputBorder(),
                      ),
                    ),
            
                    // Les boutons de reinitialisation et de validation du formulaire
                    Row(
                      spacing: MediaQueryController.screenWidth(context) <= 400 ? 5 : 20,
                      mainAxisAlignment: MediaQueryController.screenWidth(context) <= 400 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: _resetForm,
                          child: const Text("Effacer"),
                        ),
                        FilledButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){

                              for (var i = 0; i < Ingredient.values.length; i++) {
                                Ingredient? ingredient = IngredientWidget.ingredientList[i];
                                double? quantity = IngredientWidget.quantities[i];
                                if(ingredient != null && quantity != null){
                                  _ingredients.add(
                                    IngredientProportion(ingredient, quantity)
                                  );
                                }
                              }

                              _formKey.currentState!.save();
            
                              Recipe newRecipe = Recipe(
                                name: _name!,
                                pathImage: _pathImage,
                                origine: _origine!,
                                categorie: _categorie,
                                host: _host,
                                ingredients: _ingredients,
                                temperature: _temperature!,
                                cookingTime: _cookingTime!
                              );
                              Recipe.recettes.add(newRecipe);
            
                              // retour a la home page 
                              context.go("/");
                            }
                          },
                          child: const Text("Ajouter la recette"),
                        )
                      ],
                    ),
          
                    // const SizedBox(height: 15),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}