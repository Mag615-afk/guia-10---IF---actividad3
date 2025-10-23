import 'package:flutter/material.dart';
import '../models/festivity.dart';
import '../theme.dart';

class FestivityDetailScreen extends StatelessWidget {
  final Festivity festivity;

  const FestivityDetailScreen({super.key, required this.festivity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🖼 Imagen principal con Hero animation
          Hero(
            tag: festivity.nombre,
            child: Container(
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  // ✅ Usa la primera imagen de la lista
                  image: AssetImage(festivity.imagenes.first),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 🔙 Botón regresar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // 🧾 Información detallada
          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🎉 Nombre de la festividad
                      Text(
                        festivity.nombre,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: appTheme.colorScheme.primary, // ✅
                        ),
                      ),
                      const SizedBox(height: 8),

                      // 📍 Ubicación
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.grey, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            festivity.ubicacion,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // 📝 Descripción
                      Text(
                        festivity.descripcion,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.justify,
                      ),

                      const SizedBox(height: 24),

                      // 🗺 Botón "Ver ubicación"
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appTheme.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          // Aquí podrías abrir Google Maps o mostrar el mapa
                        },
                        icon: const Icon(Icons.map),
                        label: const Text('Ver ubicación'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
