import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // int championId = 0;
  @override
  void onInit() async {
    //Si il y a des arguments
    //Et si un argument à la clef 'champioId'
    super.onInit();
    await getPrice();
  }

//https://data.economie.gouv.fr/api/explore/v2.1/catalog/datasets/prix-des-carburants-en-france-flux-instantane-v2/records?limit=1&where="69330"
  int currentIndex = 0;

  final queryParameters = {'param1': ''};
  Future<void> getPrice() async {
    var url = Uri.https(
        'data.economie.gouv.fr',
        '/api/explore/v2.1/catalog/datasets/prix-des-carburants-en-france-flux-instantane-v2',
        queryParameters);
    var response = await http.get(url);
    print(response);
  }
}
