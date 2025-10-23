import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String usersUrl = 'https://jsonplaceholder.typicode.com/users';
  static const String weatherUrl = 'https://api.open-meteo.com/v1/forecast?latitude=-13.52&longitude=-71.97&current_weather=true';

  static Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse(usersUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener usuarios');
    }
  }

  static Future<Map<String, dynamic>> fetchWeather() async {
    final response = await http.get(Uri.parse(weatherUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'city': 'Cusco',
        'temperature': data['current_weather']['temperature'],
        'description': 'Cielo despejado',
      };
    } else {
      throw Exception('Error al obtener el clima');
    }
  }
}
