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
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         controller.carburant,
        //         style: const TextStyle(
        //           color: Colors.grey,
        //           fontSize: 16.0,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
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
                            color: Color.fromARGB(
                                255, 0, 0, 0), // Couleur vert clair
                          ),
                          Text(
                            "${controller.carburant}: ${station.e85Price} €",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
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
      ),
      onLoading: const CircularProgressIndicator(),
      onError: (error) => Text("Une Erreure est survenu : $error"),
    );
  }
}
