import 'package:flutter/material.dart';

class AppTheme {
  // Tema claro (rosado)
  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFE91E63), // Rosado fuerte
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFE91E63), // Rosado principal
      secondary: Color(0xFFF48FB1), // Rosado claro
      background: Color(0xFFFFF1F3), // Fondo suave rosado
      surface: Colors.white, // Superficies
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFE91E63),
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFE91E63),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    ),
  );

  // Tema oscuro (negro + acentos rosados)
  static final ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF7B1FA2), // Morado profundo
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF7B1FA2), // Morado oscuro
      secondary: Color(0xFFE91E63), // Rosado como acento
      background: Color(0xFF121212), // Fondo casi negro
      surface: Color(0xFF1E1E1E), // Superficies oscuras
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFE91E63),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.white70,
      ),
    ),
  );
}
