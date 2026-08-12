import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBarCustom extends StatelessWidget {
  const NavBarCustom({super.key, required this.currentIndex});

  final int currentIndex;

  void _goToPage(BuildContext context, int index){
    switch (index) {
      case 0: context.go("/");
        break;
      case 1: context.go("/favorite");
        break;
      default: context.go("/");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) => _goToPage(context, index),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          activeIcon: const Icon(Icons.home),
          label: "Toutes les recettes",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.star_outline),
          activeIcon: const Icon(Icons.star),
          label: "Mes recettes favorites",
        ),
      ],
    );
  }
}