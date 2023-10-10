import 'package:flutter/material.dart';
import 'package:carburantapp/bottom_navigation_bar.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _currentIndex = 2; // Index de l'élément "Paramètres"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: const Center(
        child: Text(
          'Paramètres',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex, // Assurez-vous que l'index correspond à l'élément "Paramètres"
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Get.toNamed('/home');

            }
            if (index == 1) {
              Get.toNamed('/search');

            }
            if (index == 2) {
              Get.toNamed('/settings');

            }
          });
        },
      ),
    );
  }
}
