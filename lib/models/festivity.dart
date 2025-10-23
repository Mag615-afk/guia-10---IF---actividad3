/// 🏮 Modelo de datos para una festividad de Cusco 360
class Festivity {
  final String id;
  final String nombre;
  final String descripcion;
  final String fecha;
  final String ubicacion;
  final String historia;
  final List<String> imagenes;
  final List<String> actividades;

  Festivity({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.fecha,
    required this.ubicacion,
    required this.historia,
    required this.imagenes,
    required this.actividades,
  });

  /// 🔁 Crear una festividad desde Firestore
  factory Festivity.fromMap(Map<String, dynamic> data, String documentId) {
    return Festivity(
      id: documentId,
      nombre: data['nombre'] ?? '',
      descripcion: data['descripcion'] ?? '',
      fecha: data['fecha'] ?? '',
      ubicacion: data['ubicacion'] ?? '',
      historia: data['historia'] ?? '',
      imagenes: List<String>.from(data['imagenes'] ?? []),
      actividades: List<String>.from(data['actividades'] ?? []),
    );
  }

  /// 🔁 Convertir una festividad a mapa (para guardar en Firestore)
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'fecha': fecha,
      'ubicacion': ubicacion,
      'historia': historia,
      'imagenes': imagenes,
      'actividades': actividades,
    };
  }
}
