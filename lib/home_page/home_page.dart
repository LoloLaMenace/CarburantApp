import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Bienvenue',
          style: TextStyle(
            color: Colors.grey, // Couleur de texte grisé
            fontSize: 16.0, // Taille de la police
          ),
        ),
      ),
    );
  }
}
