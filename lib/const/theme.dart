import 'package:anuflix/const/const_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getDefaultTheme() {
  return ThemeData(
      textTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: const AppBarTheme(backgroundColor: secondaryColor),
      scaffoldBackgroundColor: bgColor,
      useMaterial3: true,
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: secondaryColor));
}
