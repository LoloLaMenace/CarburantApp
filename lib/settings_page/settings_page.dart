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
            Obx(
              () => DropdownButton<String>(
                value: controller.selectedValue.value,
                onChanged: (newValue) {
                  controller.selectedValue.value = newValue!;
                  Get.replace<String>(newValue, tag: 'carburantchoice');
                },
                items: <String>['SP 95', 'SP98', 'Diesel']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
