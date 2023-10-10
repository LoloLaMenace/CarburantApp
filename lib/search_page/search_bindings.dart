import 'package:carburantapp/search_page/search_controller.dart';
import 'package:get/get.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}
