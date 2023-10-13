import 'dart:convert';

import 'package:get/get.dart';
import 'package:carburantapp/models/station_model.dart';
import 'package:http/http.dart' as http;

class CitySearchedController extends GetxController with StateMixin {
  var stationList = <Station>[];
  int currentIndex = 1;
  String city = "";
  String carburant = "";
  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    if (Get.arguments != null && Get.arguments.containsKey("city")) {
      city = Get.arguments["city"];
    }
    carburant = Get.find(tag: 'carburantchoice');
    await getPrice();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getPrice() async {
    var url = Uri.https(
        'data.economie.gouv.fr',
        '/api/explore/v2.1/catalog/datasets/prix-des-carburants-en-france-flux-instantane-v2/records',
        {
          'select':
              'id, cp, adresse, ville, gazole_prix, e10_prix, sp95_prix, sp98_prix, e85_prix, departement, code_departement, region, code_region',
          'limit': '20',
          'where': "'$city'",
          'order_by': 'gazole_prix ASC'
        });
    var response = await http.get(url);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    stationList = (jsonResponse['results'] as List).map<Station>((item) {
      return Station(
        cityName: item['ville'] ?? "Pas de ville",
        department: item['departement'] ?? "Pas de département ",
        address: item['adresse'] ?? "Pas d'adresse connu",
        gazolePrice: item['gazole_prix'] ?? "0",
        sp95Price: item['e10_prix'] ?? item['sp95_prix'] ?? "0",
        e85Price: item['e85_prix'] ?? "0",
        sp98Price: item['sp98_prix'] ?? "0",
      );
    }).toList();
  }

  void returnToSearch() {
    Get.offAndToNamed('/search');
  }
}
