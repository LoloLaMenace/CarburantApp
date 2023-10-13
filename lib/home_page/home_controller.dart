import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var priceList = <String, dynamic>{};
  @override
  void onInit() async {
    //Si il y a des arguments
    //Et si un argument à la clef 'champioId'
    super.onInit();
    await getPrice();
  }

//https://data.economie.gouv.fr/api/explore/v2.1/catalog/datasets/prix-des-carburants-en-france-flux-instantane-v2/records?limit=1&where="69330"
  int currentIndex = 0;

  final queryParameters = {'select':'id, cp, adresse, ville, gazole_prix, e10_prix, sp98_prix, departement, code_departement, region, code_region',
  'limit': '20',
  'order_by':'gazole_prix ASC'}; //gazole
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
    print(response);
    priceList = jsonDecode(response.body);
  }
}
