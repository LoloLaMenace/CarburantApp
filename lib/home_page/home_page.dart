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
        title: Row(
          children: [
            Image.asset(
              'assets/images/france_flag.png', // Chemin vers le fichier d'image du drapeau français
              width: 32, // Ajustez la largeur de l'image selon vos besoins
              height: 32, // Ajustez la hauteur de l'image selon vos besoins
            ),
            const SizedBox(width: 8), // Espacement entre l'image et le texte
            Text('Le moins cher'),
          ],
        ),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.stationList.length,
          itemBuilder: (context, index) {
            final station = controller.stationList[index];
            return Card(
              margin: EdgeInsets.all(16.0),
              child: ListTile(
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_city),
                        Text("Ville: ${station.cityName}"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.red, // Couleur bleue
                        ),
                        Text("Adresse: ${station.address}"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.home),
                        Text("Département: ${station.department}"),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_gas_station,
                          color: Colors.orange, // Couleur orange
                        ),
                        Text(
                          "Diesle : ${station.gazolePrice} €",
                          style: TextStyle(
                              color: Colors.orange), // Même couleur que l'icône
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_gas_station,
                          color: Colors.lightGreen, // Couleur vert clair
                        ),
                        Text(
                          "SP95-E10: ${station.sp95Price} €",
                          style: TextStyle(
                              color: Colors
                                  .lightGreen), // Même couleur que l'icône
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_gas_station,
                          color: Colors.green, // Couleur verte
                        ),
                        Text(
                          "SP98: ${station.sp98Price} €",
                          style: TextStyle(
                              color: Colors.green), // Même couleur que l'icône
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_gas_station,
                          color: Colors.blue, // Couleur bleue
                        ),
                        Text(
                          "E85: ${station.e85Price} €",
                          style: TextStyle(
                              color: Colors.blue), // Même couleur que l'icône
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
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
