import 'dart:convert';

import 'package:carburantapp/models/station_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController with StateMixin {
  var stationList = <Station>[];
  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    await getPrice();
    change(null, status: RxStatus.success());
    super.onInit();
  }

//https://data.economie.gouv.fr/api/explore/v2.1/catalog/datasets/prix-des-carburants-en-france-flux-instantane-v2/records?limit=1&where="69330"
  int currentIndex = 0;

  final queryParameters = {
    'select':
        'id, cp, adresse, ville, gazole_prix, e10_prix, sp95_prix, sp98_prix, e85_prix, departement, code_departement, region, code_region',
    'limit': '20',
    'order_by': 'gazole_prix ASC'
  }; //gazole
  //final queryParameters = {'limit': '20','order_by':'"e10_prix ASC"'}; //95 + 10%ethanol
  //final queryParameters = {'limit': '20','order_by':'"e85_prix ASC"'};// ethanol
  //final queryParameters = {'limit': '20','order_by':'"gplc_prix ASC"'}; // gpl
  //final queryParameters = {'limit': '20','order_by':'"sp98_prix ASC"'}; // sp98

  Future<void> getPrice() async {
    var url = Uri.https(
        'data.economie.gouv.fr',
        '/api/explore/v2.1/catalog/datasets/prix-des-carburants-en-france-flux-instantane-v2/records',
        queryParameters);
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
}
