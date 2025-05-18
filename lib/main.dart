import 'package:flutter/material.dart';
import 'services/movie_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MovieService movieService = MovieService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Películas',
      home: MovieListScreen(movieService: movieService),
    );
  }
}

class MovieListScreen extends StatelessWidget {
  final MovieService movieService;

  MovieListScreen({required this.movieService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas Populares'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: movieService.fetchPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No se encontraron películas'));
          }

          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                leading: movie['poster_path'] != null
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w92${movie['poster_path']}',
                        fit: BoxFit.cover,
                      )
                    : SizedBox(width: 50, child: Icon(Icons.movie)),
                title: Text(movie['title']),
                subtitle: Text('Fecha de estreno: ${movie['release_date']}'),
              );
            },
          );
        },
      ),
    );
  }
}
