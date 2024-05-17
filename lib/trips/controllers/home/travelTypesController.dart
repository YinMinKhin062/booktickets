import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/TravelAttributeModel.dart';

class TravelTypesController extends GetxController {
  static TravelTypesController get instance => Get.find();

  final Rx<int> currentIndex = 0.obs;
  final Rx<int> departureCurrentIndex = 0.obs;
  final Rx<int> arrivalCurrentIndex = 0.obs;

  final TextEditingController travelSearchController = TextEditingController();

  var travelAttributes = [
    TravelAttributeModel(
        name: 'Domestic', values: ["Yangon", "Mandalay", "Naypyitaw", "Bagan"]),
    TravelAttributeModel(
        name: 'International',
        values: ["South Korea", "Singapore", "Japan", "Hong Kong", "Canada"]),
  ].obs;

  List<String> travelTypesList = ["Domestic", "International"];

  var filteredAirportList = <TravelAttributeModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    filteredAirportList.assignAll(travelAttributes);
    travelSearchController.addListener(filterAirports);

    //class of flight

    // filteredAirportList.value = travelAttributes[currentIndex.value].values!;
  }

  void filterAirports() {
    final searchValue = travelSearchController.text.toLowerCase();

    if (searchValue.isEmpty) {
      filteredAirportList.assignAll(travelAttributes);
    } else {
      filteredAirportList.assignAll(travelAttributes
          .where((attribute) => attribute.values
              .any((element) => element.toLowerCase().contains(searchValue)))
          .toList());
    }
  }

  @override
  void onClose() {
    travelSearchController.dispose();
    super.onClose();
  }

  int? getIndexByValue(String value) {
    for (var attribute in travelAttributes) {
      var index = attribute.values.indexOf(value);
      if (index != -1) {
        return index;
      }
      return null;
    }
  }
}
