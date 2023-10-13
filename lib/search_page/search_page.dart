import 'package:carburantapp/search_page/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carburantapp/bottom_navigation_bar.dart';

class SearchPage extends GetView<MySearchController> {
  const SearchPage({super.key}); // Index de l'élément "Autour de moi"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                IconButton(
                  icon: const Icon(
                    Icons.search, // Icône loupe
                    color: Colors.red, // Couleur de l'icône
                  ),
                  onPressed: () {
                    controller.navigateToCitySearded();
                    print(controller.searchController.text);
                  },
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: controller
            .currentIndex, // Assurez-vous que l'index correspond à l'élément "Autour de moi"
        onTap: (int index) {
          if (index == 0) {
            Get.offAndToNamed('/home');
          }
          if (index == 1) {
            Get.offAndToNamed('/search');
          }
          if (index == 2) {
            Get.offAndToNamed('/settings');
          }
        },
      ),
    );
  }
}
