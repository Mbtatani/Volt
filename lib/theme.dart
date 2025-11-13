import 'package:flutter/material.dart';

class AppTheme {
  // Constants
  static const primaryColor = Color(0xFF00FF7F); // Vibrant Neon Green
  static const darkBackgroundColor = Color(0xFF0A0E14);
  static const lightBackgroundColor = Color(0xFFF5F5F7);
  static const darkCardColor = Color(0xFF151A23);
  static const lightCardColor = Colors.white;

  static final ThemeData premiumDarkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackgroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    cardColor: darkCardColor,
    textTheme: ThemeData.dark().textTheme.copyWith(
      bodyLarge: const TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white.withOpacity(0.7)),
      titleLarge: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(primaryColor),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor.withOpacity(0.5);
        }
        return Colors.grey.withOpacity(0.5);
      }),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: Colors.white.withOpacity(0.7),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.red),
    ),
  );

  static final ThemeData premiumLightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBackgroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    cardColor: lightCardColor,
    textTheme: ThemeData.light().textTheme.copyWith(
      bodyLarge: const TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black.withOpacity(0.7)),
      titleLarge: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(primaryColor),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor.withOpacity(0.5);
        }
        return Colors.grey.withOpacity(0.5);
      }),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: Colors.black.withOpacity(0.6),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.red),
    ),
  );
}
