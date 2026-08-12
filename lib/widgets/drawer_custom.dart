import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Toutes les recettes"),
            leading: Icon(Icons.home),
            onTap: () => context.go("/"),
          ),
          ListTile(
            title: const Text("Mes recettes favorites"),
            leading: Icon(Icons.star),
            onTap: () => context.go("/favorite"),
          )
        ]
      )
    );
  }
}