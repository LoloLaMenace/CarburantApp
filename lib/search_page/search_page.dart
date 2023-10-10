import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carburantapp/bottom_navigation_bar.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentIndex = 1; // Index de l'élément "Autour de moi"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Implémentez votre logique pour retourner à la page précédente
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200.0,
              child: Center(
                child: TextField(
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
      body: const Center(
        child: Text(
          'Rechercher votre ville et comparez',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex, // Assurez-vous que l'index correspond à l'élément "Autour de moi"
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Get.toNamed('/home');

            }
            if (index == 1) {
              Get.toNamed('/search');

            }
            if (index == 2) {
              Get.toNamed('/settings');

            }
          });
        },
      ),
    );
  }
}
