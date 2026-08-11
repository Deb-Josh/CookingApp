import 'package:cooking/screens/detail_screen.dart';
import 'package:cooking/screens/favorite_screen.dart';
import 'package:cooking/screens/home_screen.dart';
import 'package:cooking/screens/new_recipe_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/details/:id",
      builder: (context, state) {
        final id = int.parse(state.pathParameters["id"]!);
        return DetailScreen(idRecipe: id);
      },
    ),
    GoRoute(
      path: "/favorite",
      builder: (context, state) => const FavoriteScreen(),
    ),
    GoRoute(
      path: "/new-recipe",
      builder: (context, state) => const NewRecipeScreen(),
    ),
  ]
);