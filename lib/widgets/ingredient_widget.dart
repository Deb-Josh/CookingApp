import 'package:cooking/models/ingredient_proportion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IngredientWidget extends StatefulWidget {
  const IngredientWidget({
    super.key,
    required this.indexIngredient,
  });

  final int indexIngredient;

  static List<Ingredient?> ingredientList = List<Ingredient?>.filled(Ingredient.values.length, null);
  static List<double?> quantities = List<double?>.filled(Ingredient.values.length, null);

  @override
  State<IngredientWidget> createState() => _IngredientWidgetState();
}

class _IngredientWidgetState extends State<IngredientWidget> {
  @override
  Widget build(BuildContext context) {
    final indexIngredient = widget.indexIngredient;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600]!),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
      child: Row(
        children: [

          Expanded(
            flex: 2,
            child: DropdownButtonFormField<Ingredient>(
              initialValue: IngredientWidget.ingredientList[indexIngredient],
              isExpanded: false,
              validator: (value) => (value == null || value.name.isEmpty) ? "Pas d'ingrédient!" : null,
              items: Ingredient.values.map((ingredient) => 
                DropdownMenuItem(value: ingredient, child: Text("${ingredient.name}(${ingredient.unity})")),
              ).toList(),
              onSaved: (value) => IngredientWidget.ingredientList[indexIngredient] = value!,
              onChanged: (Ingredient? newValue) {
                if(newValue != null) {
                  setState(() => IngredientWidget.ingredientList[indexIngredient] = newValue);
                }
              },
              decoration: const InputDecoration(
                labelText: "Ingrédient",
                border: InputBorder.none,
              ),
            ),
          ),

          Container(width: 1, height: 50, color: Colors.grey[600],),
          SizedBox(width: 3),
      
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: (value) {

                return (value == null || value.isEmpty) ? "Quantité invalide!" : (double.parse(value) < 1) ? "Une quantité >= 1" : null;
                
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"^\d*\.?\d*")),
              ],
              onSaved: (value) => IngredientWidget.quantities[indexIngredient] = double.parse(value!),
              decoration: const InputDecoration(
                labelText: "Quantité",
                border: InputBorder.none,
              ),
            ),
          ),
        ]
      ),  
    );
  }
}