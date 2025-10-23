import 'package:flutter/material.dart';
import '../widgets/festivity_card.dart';
import '../models/festivity.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Festivity> festivities = [
      Festivity(
        id: '1',
        nombre: 'Inti Raymi',
        descripcion:
            'Una de las celebraciones más importantes del Cusco, en honor al dios Sol.',
        fecha: '24 de Junio',
        ubicacion: 'Cusco',
        historia:
            'Celebración inca en honor al dios Sol que se realiza cada 24 de junio.',
        imagenes: [
          'https://upload.wikimedia.org/wikipedia/commons/f/f4/Inti_Raymi_Cusco_Peru.jpg'
        ],
        actividades: ['Desfile', 'Danzas tradicionales', 'Ceremonias religiosas'],
      ),
      Festivity(
        id: '2',
        nombre: 'Corpus Christi',
        descripcion:
            'Tradición religiosa que reúne a santos y vírgenes del Cusco en procesión.',
        fecha: 'Junio',
        ubicacion: 'Cusco',
        historia:
            'Fiesta católica donde se procesionan imágenes de santos y vírgenes por la ciudad.',
        imagenes: [
          'https://www.scielo.cl/img/revistas/bmchap/v23n2//0718-6894-bmchap-23-02-121-gf3.jpg'
        ],
        actividades: ['Procesión', 'Misa', 'Danzas folklóricas'],
      ),
      Festivity(
        id: '3',
        nombre: 'Virgen del Carmen',
        descripcion:
            'Fiesta en Paucartambo con danzas típicas y coloridas mascaradas.',
        fecha: '16 de Julio',
        ubicacion: 'Paucartambo',
        historia:
            'Celebración en honor a la Virgen del Carmen, con danzas y máscaras tradicionales.',
        imagenes: [
          'https://www.peru.travel/Contenido/General/Imagen/es/1635/1.1/virgen-del-carmen-paucartambo.jpg'
        ],
        actividades: ['Danzas típicas', 'Mascaradas', 'Procesión'],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
        title: const Text(
          'Cusco 360',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: Color(0xFF475569)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner principal
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/1/1e/Cusco_City_View.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Descubre Cusco\ny sus tradiciones',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(0, 1),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Título de sección
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Festividades destacadas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Lista de festividades
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: festivities.length,
                itemBuilder: (context, index) {
                  final festivity = festivities[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: FestivityCard(
                      festivity: festivity,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Abrir ${festivity.nombre}')),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF2563EB),
        unselectedItemColor: const Color(0xFF94A3B8),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Eventos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
