import 'package:carburantapp/recherche_page/recherche_controller.dart';
import 'package:get/get.dart';

class RechercheBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RechercheController());
  }
}
