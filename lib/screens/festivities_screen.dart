import 'package:flutter/material.dart';
import '../models/festivity.dart';
import '../services/mock_service.dart';
import '../widgets/festivity_card.dart';
import '../theme.dart';
import 'festivity_detail.dart';

class FestivitiesScreen extends StatefulWidget {
  const FestivitiesScreen({super.key});

  @override
  State<FestivitiesScreen> createState() => _FestivitiesScreenState();
}

class _FestivitiesScreenState extends State<FestivitiesScreen> {
  final MockService _service = MockService();
  List<Festivity> _festivities = [];
  String _query = '';

  @override
  void initState() {
    super.initState();
    _loadFestivities();
  }

  Future<void> _loadFestivities() async {
    final data = await _service.fetchFestivities();
    setState(() {
      _festivities = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredFestivities = _festivities
        .where((f) =>
            f.nombre.toLowerCase().contains(_query.toLowerCase()) ||
            f.ubicacion.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Festividades del Perú 🇵🇪',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: appTheme.primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 🔍 Barra de búsqueda moderna
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar festividad...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
            ),
          ),

          // 📅 Grid de festividades
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredFestivities.length,
              itemBuilder: (context, index) {
                final festivity = filteredFestivities[index];

                // ⚡ FestivityCard con imagen y onTap
                return FestivityCard(
                  festivity: festivity,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            FestivityDetailScreen(festivity: festivity),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
