import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieService {
  final String apiKey = '5a47e596a10ecc9b3d8d3a60a017e58d'; // Cambia aquí tu API Key de TMDb
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<dynamic>> fetchPopularMovies() async {
    final url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey&language=en-US&page=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData['results'];
    } else {
      throw Exception('Error al obtener películas populares');
    }
  }
}
