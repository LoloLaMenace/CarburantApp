import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio; 


class SearchController extends GetxController with StateMixin{
  final TextEditingController cityController = TextEditingController();
  RxList<dynamic> searchResults = RxList<dynamic>([]);

  Future<void> fetchData() async {
    final dio.Dio dioClient = dio.Dio();
    String cityName = cityController.text;
    try {
      dio.Response response = await dioClient.get(
        'https://data.economie.gouv.fr/api/explore/v2.1/catalog/datasets/prix-des-carburants-en-france-flux-instantane-v2/records',
        queryParameters: {
          'limit': 15,
          'where': 'ville="$cityName"', 
        },
      );

      searchResults.assignAll(response.data['records']);
      print(response.data);
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  void onClose() {
    // Nettoyez le contrôleur lorsqu'il n'est plus utilisé
    cityController.dispose();
    super.onClose();
  }
}
