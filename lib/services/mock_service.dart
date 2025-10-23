import 'dart:async';
import '../models/festivity.dart';

/// Servicio simulado que devuelve datos de festividades.
/// Más adelante puedes reemplazar esto con Firebase o una API real.
class MockService {
  /// Obtiene todas las festividades (simuladas)
  Future<List<Festivity>> fetchFestivities() async {
    await Future.delayed(const Duration(milliseconds: 800)); // Simula carga

    return [
      Festivity(
        id: '1',
        nombre: 'Inti Raymi',
        descripcion:
            'El Inti Raymi es una antigua ceremonia Inca en honor al dios Sol, celebrada cada 24 de junio en Cusco.',
        fecha: '24 de junio',
        ubicacion: 'Cusco, Perú',
        historia:
            'El Inti Raymi fue una de las ceremonias más importantes del Tahuantinsuyo y simbolizaba el inicio del nuevo ciclo agrícola.',
        imagenes: [
          'https://upload.wikimedia.org/wikipedia/commons/8/84/Inti_Raymi_Cusco_Peru.jpg'
        ],
        actividades: [
          'Desfile ceremonial',
          'Ritual al Sol',
          'Música y danzas tradicionales'
        ],
      ),
      Festivity(
        id: '2',
        nombre: 'Señor de los Temblores',
        descripcion:
            'Festividad religiosa más importante de Cusco, realizada en Semana Santa.',
        fecha: 'Lunes Santo',
        ubicacion: 'Catedral del Cusco',
        historia:
            'Se celebra desde el siglo XVII como muestra de gratitud por haber protegido la ciudad de un gran terremoto.',
        imagenes: [
          'https://upload.wikimedia.org/wikipedia/commons/4/4b/Se%C3%B1or_de_los_Temblores.jpg'
        ],
        actividades: [
          'Procesión del Señor de los Temblores',
          'Ofrendas florales',
          'Ceremonias religiosas'
        ],
      ),
      Festivity(
        id: '3',
        nombre: 'Corpus Christi',
        descripcion:
            'Procesión en la que se reúnen las imágenes de los santos y vírgenes de Cusco en una gran celebración.',
        fecha: 'Junio (movible)',
        ubicacion: 'Plaza de Armas de Cusco',
        historia:
            'Desde la época colonial, las parroquias llevan a sus santos y vírgenes a la catedral para rendir homenaje a la Eucaristía.',
        imagenes: [
          'https://upload.wikimedia.org/wikipedia/commons/f/f0/Corpus_Christi_Cusco.jpg'
        ],
        actividades: [
          'Procesiones',
          'Música y danzas típicas',
          'Comida tradicional'
        ],
      ),
      Festivity(
        id: '4',
        nombre: 'Virgen del Carmen',
        descripcion:
            'Celebración popular en Paucartambo con danzas típicas y coloridas máscaras.',
        fecha: '16 de julio',
        ubicacion: 'Paucartambo, Cusco',
        historia:
            'Declarada Patrimonio Cultural de la Nación, esta festividad mezcla la devoción religiosa con tradiciones andinas.',
        imagenes: [
          'https://upload.wikimedia.org/wikipedia/commons/7/79/Virgen_del_Carmen_Paucartambo.jpg'
        ],
        actividades: [
          'Desfiles y danzas',
          'Misas y procesiones',
          'Fiestas populares'
        ],
      ),
    ];
  }

  /// Obtiene una festividad por ID
  Future<Festivity?> getFestivityById(String id) async {
    final festivities = await fetchFestivities();
    try {
      return festivities.firstWhere((f) => f.id == id);
    } catch (e) {
      return null;
    }
  }
}
