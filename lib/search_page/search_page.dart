import 'package:carburantapp/search_page/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carburantapp/bottom_navigation_bar.dart';

class SearchPage extends GetView<MySearchController> {
  const SearchPage({super.key}); // Index de l'élément "Autour de moi"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200.0,
              child: Center(
                child: TextField(
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    hintText: 'Rechercher...',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Rechercher votre ville et comparez',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0), // Espace entre le texte et le bouton
            ElevatedButton(
              onPressed: () {
                print(controller.searchController.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Couleur du bouton
                padding:
                    const EdgeInsets.all(15.0), // Espacement interne du bouton
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // Bordure du bouton
                ),
              ),
              child: const Text(
                'Rechercher',
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
            .currentIndex, // Assurez-vous que l'index correspond à l'élément "Autour de moi"
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
