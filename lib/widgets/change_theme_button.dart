import 'package:cooking/models/theme_controller.dart';
import 'package:flutter/material.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeController.themeMode,
      builder: (context, themeMode, child) {
        return IconButton(
          onPressed: themeController.changeTheme,
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, anim) => RotationTransition(turns: anim, child: child),
            child: Icon(
              themeController.isDark ? Icons.light_mode : Icons.dark_mode
            )
          ),
          tooltip: themeController.isDark ? "Mode Clair" : "Mode sombre",
        );
      }
    );
  }
}