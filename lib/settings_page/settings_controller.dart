import 'package:get/get.dart';

class SettingsController extends GetxController {
  int currentIndex = 2;
  RxString selectedValue = Get.find<String>(tag: 'carburantchoice').obs;
}
