import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const Cusco360App());
}

class Cusco360App extends StatelessWidget {
  const Cusco360App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cusco 360',
      home: const HomeScreen(), // 👈 Esta línea es clave
    );
  }
}
