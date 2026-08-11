import 'package:flutter/material.dart';

class ThemeController {
  final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.system);

  void changeTheme(){
    if(themeMode.value == ThemeMode.light){
      themeMode.value = ThemeMode.dark;
    }else{
      themeMode.value = ThemeMode.light;
    }
  }

  bool get isDark => themeMode.value == ThemeMode.dark;
}

final themeController = ThemeController();