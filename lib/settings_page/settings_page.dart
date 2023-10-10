import 'package:carburantapp/settings_page/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:carburantapp/bottom_navigation_bar.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Selectionnez votre carburant :"),
            DropdownButton<String>(
              value: controller.selectedValue,
              onChanged: (newValue) {
                controller.selectedValue = newValue!;
              },
              items: <String>['TOUS', 'SP 95', 'SP98', 'DIESEL']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20.0), // Espace entre le texte et le bouton
            ElevatedButton(
              onPressed: () {
                // Implémentez ici la logique lorsque le bouton "Rechercher" est appuyé
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 10, 154, 3), // Couleur du bouton
                padding:
                    const EdgeInsets.all(15.0), // Espacement interne du bouton
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // Bordure du bouton
                ),
              ),
              child: const Text(
                'Enregistrer votre choix',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: controller
            .currentIndex, // Assurez-vous que l'index correspond à l'élément "Paramètres"
        onTap: (int index) {
          if (index == 0) {
            Get.toNamed('/home');
          }
          if (index == 1) {
            Get.toNamed('/search');
          }
          if (index == 2) {
            Get.toNamed('/settings');
          }
        },
      ),
    );
  }
}
