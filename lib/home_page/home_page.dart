import 'package:carburantapp/bottom_navigation_bar.dart';
import 'package:carburantapp/home_page/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < 10; i++)
                CityCard(
                  cityName: 'Ville $i',
                  department: 'Département $i',
                  address: 'Adresse $i',
                  fuelPrices: {
                    'Diesel': 1.5, // Prix du Diesel
                    'SP95-E10': 1.7, // Prix du SP95-E10
                    'SP98': 1.8, // Prix du SP98
                    'Éthanol': 1.4, // Prix de l'éthanol
                  },
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: (int index) {
          if (index == 0) {
            Get.offAndToNamed('/home');
          } else if (index == 1) {
            Get.offAndToNamed('/search');
          } else if (index == 2) {
            Get.offAndToNamed('/settings');
          }
        },
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final String cityName;
  final String department;
  final String address;
  final Map<String, double> fuelPrices;

  CityCard({
    required this.cityName,
    required this.department,
    required this.address,
    required this.fuelPrices,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Ville: $cityName'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Département: $department'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Adresse: $address'),
            ),
            SizedBox(height: 16.0),
            Column(
              children: [
                Text(
                  'Type de carburant:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                for (var entry in fuelPrices.entries)
                  ListTile(
                    leading: FuelIcon(entry.key),
                    title: Text(
                      '${entry.key} - Prix: ${entry.value.toStringAsFixed(2)} €/L',
                      style: TextStyle(
                        color: getFuelColor(entry.key),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FuelIcon extends StatelessWidget {
  final String fuelType;

  FuelIcon(this.fuelType);

  @override
  Widget build(BuildContext context) {
    switch (fuelType) {
      case 'Diesel':
        return Icon(Icons.local_gas_station, color: Colors.orange);
      case 'SP95-E10':
        return Icon(Icons.local_gas_station, color: Colors.lightGreen);
      case 'SP98':
        return Icon(Icons.local_gas_station, color: Colors.green);
      case 'Éthanol':
        return Icon(Icons.local_gas_station, color: Colors.blue);
      default:
        return Icon(Icons.local_gas_station);
    }
  }
}

Color getFuelColor(String fuelType) {
  switch (fuelType) {
    case 'Diesel':
      return Colors.orange;
    case 'SP95-E10':
      return Colors.lightGreen;
    case 'SP98':
      return Colors.green;
    case 'Éthanol':
      return Colors.blue;
    default:
      return Colors.black;
  }
}
