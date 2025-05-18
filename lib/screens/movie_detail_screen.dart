
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            movie.posterPath.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: 'https://image.tmdb.org/t/p/w500\${movie.posterPath}',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Icon(Icons.movie, size: 100),
            SizedBox(height: 16.0),
            Text(
              movie.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Fecha de estreno: \${movie.releaseDate}'),
            SizedBox(height: 8.0),
            Text('Calificación: \${movie.voteAverage}'),
            SizedBox(height: 16.0),
            Text(
              movie.overview,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
