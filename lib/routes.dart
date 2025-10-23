import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/festivities_screen.dart';
import 'screens/festivity_detail.dart';

/// 📍 Configuración de rutas para Cusco 360
/// Permite usar navegación por nombre (named routes)
class AppRoutes {
  static const String home = '/';
  static const String festivities = '/festivities';
  static const String festivityDetail = '/festivity_detail';

  /// Mapa de rutas
  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomeScreen(),
      festivities: (context) => const FestivitiesScreen(),
      // ⚠️ festivityDetail no usa const porque requiere argumento
      festivityDetail: (context) {
        final args =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        return FestivityDetailScreen(festivity: args?['festivity']);
      },
    };
  }
}
