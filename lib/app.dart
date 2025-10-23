import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/home_screen.dart';

/// 🌎 Cusco 360 App
/// App principal que configura tema, idioma y ruta inicial.
class Cusco360App extends StatelessWidget {
  const Cusco360App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cusco 360',
      debugShowCheckedModeBanner: false,
      theme: appTheme, // 👈 importado desde theme.dart
      home: const HomeScreen(), // 👈 pantalla inicial
      locale: const Locale('es'), // idioma por defecto (español)
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
        Locale('qu'), // Quechua
      ],
      localizationsDelegates: const [
        // Estos delegados permiten soporte i18n
        // (se pueden activar más adelante con intl)
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
