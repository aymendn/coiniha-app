import 'package:flutter/material.dart';

// Main Colors (Primary and Secondary)
class AppColor {
  const AppColor._();

  static const primary = Colors.blue;
  static const secondary = Colors.orangeAccent;

}


// Further Color Cutomization
extension CustomColorScheme on ColorScheme {

  
  // Color get baseColor =>
  //     brightness == Brightness.light ? Colors.white : Colors.black;

}