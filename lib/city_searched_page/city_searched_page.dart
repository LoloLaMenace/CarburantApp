import 'package:carburantapp/bottom_navigation_bar.dart';
import 'package:carburantapp/city_searched_page/city_searched_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitySearchedPage extends GetView<CitySearchedController> {
  const CitySearchedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rechercher votre ville et comparez',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
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
