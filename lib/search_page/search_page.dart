import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio; // Utilisez un préfixe (ici, 'dio')
import 'package:carburantapp/bottom_navigation_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _cityController = TextEditingController();
  List<dynamic> _searchResults = [];

  Future<void> _fetchData(String cityName) async {
    final dio.Dio dioClient = dio.Dio(); // Utilisez le préfixe 'dio'
    try {
      dio.Response response = await dioClient.get( // Utilisez le préfixe 'dio'
        'https://data.economie.gouv.fr/api/explore/v2.1/catalog/datasets/prix-des-carburants-en-france-flux-instantane-v2/records',
        queryParameters: {
          'limit': 10,
          'where': '"$cityName"',
        },
      );
      setState(() {
        _searchResults = response.data['records'];
      });
    } catch (error) {
      print(error.toString());
    }
  }

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
                  controller: _cityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Entrez votre ville',
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
            icon: const Icon(Icons.search),
            onPressed: () {
              String cityName = _cityController.text;
              if (cityName.isNotEmpty) {
                _fetchData(cityName);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          var item = _searchResults[index];
          return ListTile(
            title: Text(item['fields']['adresse']),
            subtitle: Text(item['fields']['ville']),
            // Affichez d'autres détails selon votre besoin
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1, // Assurez-vous que l'index correspond à l'élément "Autour de moi"
        onTap: (int index) {
          setState(() {
            if (index == 0) {
              Get.toNamed('/home');
            } else if (index == 1) {
              // Restez sur la page de recherche
            } else if (index == 2) {
              Get.toNamed('/settings');
            }
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}
