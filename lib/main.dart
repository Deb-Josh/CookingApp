// import 'package:cooking/models/media_query_controller.dart';
import 'package:cooking/models/theme_controller.dart';
import 'package:cooking/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const CookingApp());
}

class CookingApp extends StatelessWidget {
  const CookingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeController.themeMode,
      builder: (context, themeMode, child) {
        return MaterialApp.router(
          // builder: (context, child) {
          //   MediaQueryController.init(context);
          //   return child!;
          // },
          title: 'Cooking App',
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepOrange
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepOrange,
              brightness: Brightness.dark
            ),
            useMaterial3: true,
          ),
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
        );
      }
    );
  }
}