<p align="center">
  <img src="assets/logo1.png" alt="Logo de Cooking App" width="200">
</p>

# CookingApp
Application Flutter de recettes de cuisine

# Lancement de l'application
- Se positionner à la racine du projet
- Taper la commande : `flutter run -d <id_appareil>`

# Lancement des tests
- Se positionner à la racine du projet
- Taper la commande : `flutter test -r expanded`

# Fonctionnalités implémentées
- Listing des recettes de cuisine
- Possibilité de filtrer les recettes selon leur origine ou encore leur catégorie
- Afficher plus en détails une recette pour voir tous les ingrédients
- Mettre tes recettes préférées en favoris
- Ajouter tes propres recettes de façon personnalisée
- Gestion du thème de l'application en mode clair ou sombre

# Dépendances utilisées
- ***cupertino_icons*** : Pour la police des icones sur Apple pour le style IOS (installation automatique a la creation d'un projet flutter)
- ***go_router*** : Utiliser pour la gestion de la navigation et du routing - `flutter pub add go_router`
- ***provider*** : Gestion de l'etat de l'app entre les differents ecrans (State Managment basique) - `flutter pub add provider`
- ***fluttertoast*** : a permi l'integration des toast modernes - `flutter pub add fluttertoast`

# Aperçu de l'application
L'app est entièrement responsive et se présente bien sur tous types d'écran (Mobile, Tablet et Desktop)

## Vue Desktop
![Vue Desktop](assets/screenshots/desktop_preview.PNG)

## Vues Mobile
### 1. Page d'accueil (listing/Filtrage/Recherche)
![Page d'accueil](assets/screenshots/home_page.PNG)

### 2. Page des recettes favorites
![Page des recettes favorites](assets/screenshots/favorite_page.PNG)

### 3. Page de détails des recettes (Ingredients/Temps de cuisson/Temperature de cuisson/...)
![Page de détails des recettes](assets/screenshots/details_page.PNG)

### 4. Page d'ajout d'une nouvelle recette
![Page d'ajout d'une nouvelle recette](assets/screenshots/new_recipe_page.PNG)