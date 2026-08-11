import 'package:flutter/material.dart';

class MediaQueryController {

  static double screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

  static double w(BuildContext context, double percentage) => MediaQuery.sizeOf(context).width / 100 * percentage;

  static double h(BuildContext context, double percentage) => MediaQuery.sizeOf(context).height / 100 * percentage;

  static bool isMobile(BuildContext context) =>  MediaQuery.sizeOf(context).width < 600;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= 600 && width < 1200;
  }

  static bool isDesktop(BuildContext context) => MediaQuery.sizeOf(context).width >= 1200;

  static bool isPortrait(BuildContext context) => MediaQuery.orientationOf(context) == Orientation.portrait;
}


// Autre facon de faire

// class MediaQueryController {
//   static late double screenWidth;
//   static late double screenHeight;
//   static late double blockSizeHorizontal;
//   static late double blockSizeVertical;

//   static late double safeAreaHorizontal;
//   static late double safeAreaVertical;
//   static late double safeBlockHorizontal;
//   static late double safeBlockVertical;

//   static bool _isInit = false;

//   static void init(BuildContext context) {
//     if (_isInit) return; // pour eviter les reinitialisation inutiles
    
//     screenWidth = MediaQuery.sizeOf(context).width;
//     screenHeight = MediaQuery.sizeOf(context).height;
    
//     final padding = MediaQuery.paddingOf(context);
//     // final orientation = MediaQuery.orientationOf(context);

//     blockSizeHorizontal = screenWidth / 100;
//     blockSizeVertical = screenHeight / 100;

//     safeAreaHorizontal = padding.left + padding.right;
//     safeAreaVertical = padding.top + padding.bottom;
//     safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
//     safeBlockVertical = (screenHeight - safeAreaVertical) / 100;
    
//     _isInit = true;
//   }

//   // Hauteur et Largeur en %
//   static double w(double percentage) => blockSizeHorizontal * percentage;
//   static double h(double percentage) => blockSizeVertical * percentage;
  
//   // Hauteur et Largeur safe en %
//   static double sw(double percentage) => safeBlockHorizontal * percentage;
//   static double sh(double percentage) => safeBlockVertical * percentage;

//   // Taille de police responsive
//   static double sp(double fontSize) => blockSizeHorizontal * fontSize;

//   // Breakpoints
//   static bool get isMobile => screenWidth < 600;
//   static bool get isTablet => screenWidth >= 600 && screenWidth < 1200;
//   static bool get isDesktop => screenWidth >= 1200;

//   // Orientation
//   static bool isPortrait(BuildContext context) => MediaQuery.orientationOf(context) == Orientation.portrait;
// }