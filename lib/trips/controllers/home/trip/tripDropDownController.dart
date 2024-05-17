import 'package:get/get.dart';

class TripDownDownController extends GetxController {
  static TripDownDownController get instance => Get.find();

  Rx<String> selectedValue = "".obs;
  Rx<String> departureSelectedValue = "".obs;
  Rx<String> arrivalSelectedValue = "".obs;
}
