import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors{
  static const Color black = Color(0xFF3C3C3C);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF014ea1);
  static const Color blueLight = Color(0xFFb1d6fe);
  static const Color greyLight = Color(0xFFA3A3A3);
  static const Color darkGrey = Color(0xFFD9D9D9);
  static Color get primaryColor1 => const Color(0xff0177f9); //6ca4bc          //  92a5fd
  static Color get primaryColor2 => const Color(0xff014ea1); //79b9d3         // 9dcdff
  static List<Color> get primaryG => [ primaryColor2, primaryColor1 ];
  static List<Color> get dGray => [ darkGrey, darkGrey];
}