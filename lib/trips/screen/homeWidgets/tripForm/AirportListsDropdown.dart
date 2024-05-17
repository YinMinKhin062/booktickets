import 'package:booktickets/trips/controllers/home/trip/bookingController.dart';
import 'package:booktickets/trips/controllers/home/trip/tripDropDownController.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/Sizes.dart';

class AirportListsDropdown extends StatelessWidget {
  const AirportListsDropdown(
      {super.key,
      required this.cities,
      required this.hintTxt,
      // required this.icon,
      this.isRotate = false});

  final List<String> cities;
  // final Widget icon;
  final bool isRotate;
  final String hintTxt;

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    final tripddController = Get.put(TripDownDownController());
    final bookController = Get.put(BookingController());
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      value: cities[0],
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.tune),
          focusedBorder: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.blue.shade300),
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: Sizes.spaceBtn - 4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      hint: Text('Airport or City',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.grey,
              )),
      items: cities
          .map((item) => DropdownMenuItem<String>(
              value: item,
              enabled: hintTxt.toLowerCase() == "arrival" &&
                      item == bookController.departure.value
                  ? false
                  : true,
              child: Text(
                item,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: hintTxt.toLowerCase() == "arrival" &&
                            item == bookController.departure.value
                        ? Colors.grey
                        : Colors.black),
              )))
          .toList(),
      onChanged: (value) {
        if (hintTxt.toLowerCase() == "departure") {
          tripddController.departureSelectedValue.value = value!;
          bookController.departure.value = value;
          Get.back();
        } else {
          tripddController.arrivalSelectedValue.value = value!;
          bookController.arrival.value = value;
          Get.back();
        }
        // tripddController.selectedValue.value = value!;
        // bookController.departure.value = value;
        // Get.back();
      },
      onSaved: (newValue) {
        // selectedValue = newValue;
      },
      buttonStyleData:
          const ButtonStyleData(padding: EdgeInsets.only(right: 8)),
      iconStyleData: const IconStyleData(icon: Icon(Icons.arrow_drop_down)),
      dropdownStyleData: DropdownStyleData(
        width: 305,
        maxHeight: 200,
        offset: const Offset(-43, -12),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(40),
          thickness: MaterialStateProperty.all(6),
          thumbVisibility: MaterialStateProperty.all(true),
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      ),
      menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 20)),
      dropdownSearchData: DropdownSearchData(
        searchController: textEditingController,
        searchInnerWidgetHeight: 50,
        searchInnerWidget: Container(
          height: 50,
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          child: TextFormField(
            autofocus: true,
            expands: true,
            maxLines: null,
            controller: textEditingController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              hintText: 'Search for an item...',
              hintStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        searchMatchFn: (item, searchValue) {
          return item.value.toString().toLowerCase().contains(searchValue);
        },
      ),
      onMenuStateChange: (isOpen) {
        if (!isOpen) {
          textEditingController.clear();
        }
      },
    );
  }
}
