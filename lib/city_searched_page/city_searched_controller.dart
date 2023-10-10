import 'package:get/get.dart';

class CitySearchedController extends GetxController with StateMixin {
  int currentIndex = 1;
  String city = "";
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    if (Get.arguments != null && Get.arguments.containsKey("city")) {
      city = Get.arguments["city"];
    }
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void returnToSearch() {
    Get.offAndToNamed('/search');
  }
}
