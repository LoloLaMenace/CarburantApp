import 'package:carburantapp/city_searched_page/city_searched_controller.dart';
import 'package:get/get.dart';

class CitySearchedBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CitySearchedController());
  }
}
