import 'package:cooking/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cooking/routes/app_router.dart';


void main(){

  testWidgets("Routes : Test sur le flux de navigation entre les pages de l'app", (WidgetTester tester) async{
    final old = FlutterError.onError;
    try{
      FlutterError.onError = (details){
        if(!details.exception.toString().contains("overflow")){
          old?.call(details);
        }
      };

      // Build de l'app
      await tester.pumpWidget(const CookingApp());
      await tester.pumpAndSettle();

      // Fonction renvoyant la route courante
      String currentLocation() => appRouter.routerDelegate.currentConfiguration.uri.toString();

      // Verifier que la route initiale corresponde bien a l'ecran d'accueil
      expect(currentLocation(), "/");

      // // Taper sur le bouton qui permet d'aller a l'ecran des recettes favorites
      // await tester.tap(find.byIcon(Icons.star_outline));
      // await tester.pumpAndSettle();
      
      // // Verifier que la route est desormais celle de l'ecran favorite_screen
      // expect(currentLocation(), "/favorite");

      // // Taper sur le bouton qui permet d'aller a l'ecran d'accueil
      // await tester.tap(find.byIcon(Icons.home_outlined));
      // await tester.pumpAndSettle();

      // // Verifier que la route est redevenu la route initiale
      // expect(currentLocation(), "/");

      // Taper sur le bouton permettant d'afficher l'ecran d'ajout d'une nouvelle recette
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Verifier que la route est desormais celle de l'ecran new_recipe_screen
      expect(currentLocation(), "/new-recipe");

    }finally{
      FlutterError.onError = old;
    }

  });

}