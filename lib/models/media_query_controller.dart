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