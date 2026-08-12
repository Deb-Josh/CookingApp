import 'package:cooking/models/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cooking/main.dart';

void main() {
  setUp(() {
    // Réinitialiser avant chaque test pour que les tests ne s'influencent pas
    themeController.themeMode.value = ThemeMode.light;
  });

  group("Changement de thème de l'application", (){

    test("Test logique: Utilisation de la fonction changeTheme()", () {
      // Verifier que le theme initial est le mode clair
      expect(themeController.themeMode.value, ThemeMode.light);
      expect(themeController.isDark, false);

      // Appliquer le changement de theme
      themeController.changeTheme();

      // Verifier que le theme a changé
      expect(themeController.themeMode.value, ThemeMode.dark);
      expect(themeController.isDark, true);

      // Appliquer a nouveau le changement de theme
      themeController.changeTheme();
      
      expect(themeController.themeMode.value, ThemeMode.light);
      expect(themeController.isDark, false);
    });

    testWidgets("Test UI : Changer de theme en tapant sur le bouton y dédié", (WidgetTester tester) async {
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

        // Verifier que le theme initial est le mode clair
        expect(themeController.themeMode.value, ThemeMode.light);
        expect(themeController.isDark, false);

        // Taper sur le bouton de changement de theme
        await tester.tap(find.byIcon(Icons.dark_mode));
        await tester.pumpAndSettle(); // attend que ValueNotifier notifie MaterialApp

        // Verifier que le theme a changé
        expect(themeController.themeMode.value, ThemeMode.dark);
        expect(themeController.isDark, true);

        // Retaper sur le bouton de changement de theme pour repasser en light
        await tester.tap(find.byIcon(Icons.light_mode));
        await tester.pumpAndSettle();
        
        expect(themeController.themeMode.value, ThemeMode.light);
        expect(themeController.isDark, false);

      }finally{
        FlutterError.onError = old;
      }
      
    });

  });

}