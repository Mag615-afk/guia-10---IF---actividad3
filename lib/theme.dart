import 'package:flutter/material.dart';

/// 🎨 Tema general de la aplicación Cusco 360
/// Inspirado en colores tierra y dorado (cultura inca)
final ThemeData appTheme = ThemeData(
  useMaterial3: true, // habilita Material Design 3 (recomendado)
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFB8860B), // dorado inca
    primary: const Color(0xFFB8860B),
    secondary: const Color(0xFF6B4226),
    background: const Color(0xFFFFF8E7),
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
  ),
  scaffoldBackgroundColor: const Color(0xFFFFF8E7),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFB8860B),
    foregroundColor: Colors.white,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFB8860B),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    ),
  ),
);
