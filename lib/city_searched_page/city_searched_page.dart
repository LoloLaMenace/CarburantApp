import 'package:carburantapp/bottom_navigation_bar.dart';
import 'package:carburantapp/city_searched_page/city_searched_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitySearchedPage extends GetView<CitySearchedController> {
  const CitySearchedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              controller.returnToSearch();
            },
          ),
          title: Text(controller.city),
        ),
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
      ),
      onLoading: const CircularProgressIndicator(),
      onError: (error) => Text("Une Erreure est survenu : $error"),
    );
  }
}
