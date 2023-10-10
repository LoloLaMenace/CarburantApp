import 'package:carburantapp/recherche_page/recherche_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecherchePage extends GetView<RechercheController> {
  const RecherchePage({super.key});

  void returnTohome() {
    Get.toNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            returnTohome();
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
    );
  }
}
