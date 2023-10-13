import 'package:carburantapp/bottom_navigation_bar.dart';
import 'package:carburantapp/home_page/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: const Center(
        child: Text(
          'Bienvenue...',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: controller.currentIndex,
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
