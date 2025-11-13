import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volt/providers/settings_provider.dart';
import 'package:volt/providers/theme_provider.dart';
import 'package:volt/screens/profile/profile_screen.dart';
import 'package:volt/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Volt',
          theme: AppTheme.premiumLightTheme,
          darkTheme: AppTheme.premiumDarkTheme,
          themeMode: themeProvider.themeMode,
          home: const ProfileScreen(),
        );
      },
    );
  }
}
