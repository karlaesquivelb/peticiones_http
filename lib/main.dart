
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MovieCatalogApp());
}

class MovieCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Películas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
