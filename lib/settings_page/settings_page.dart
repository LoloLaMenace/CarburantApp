import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Paramètres',
          style: TextStyle(
            color: Colors.grey, // Couleur de texte grisé
            fontSize: 16.0, // Taille de la police
          ),
        ),
      ),
    );
  }
}
