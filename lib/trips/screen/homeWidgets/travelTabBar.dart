import 'package:booktickets/trips/controllers/home/travelTypesController.dart';
import 'package:booktickets/trips/controllers/home/trip/bookingController.dart';
import 'package:booktickets/trips/controllers/home/tripTypesController.dart';
import 'package:booktickets/trips/screen/homeWidgets/RoundTripBookingForm.dart';
import 'package:booktickets/trips/screen/homeWidgets/oneWayBookingForm.dart';
import 'package:booktickets/trips/screen/homeWidgets/travel/AirtportLists.dart';
import 'package:booktickets/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/Sizes.dart';

import '../widgets/circularContainer.dart';
import 'tripForm/AirportListsDropdown.dart';

class TravelTabBar extends StatelessWidget {
  const TravelTabBar(
      {super.key, required this.travelListType, required this.hintTxt});

  final List<String> travelListType;
  final String hintTxt;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TravelTypesController());
    final bookController = Get.put(BookingController());

    return Column(
      children: [
        //search box
        // TextFormField(
        //   readOnly: true,
        //   controller: controller.travelSearchController,
        //   decoration: InputDecoration(
        //       contentPadding: EdgeInsets.all(10),
        //       labelText: hintTxt,
        //       labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
        //       suffixIcon: Icon(Icons.search)),
        // ),

        // const SizedBox(
        //   height: Sizes.spaceBtn,
        // ),

        //Travel types tab bar
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < travelListType.length; i++)
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = i;
                  },
                  child: CircularContainer(
                    margin: Sizes.spaceBtn / 3,
                    bgColor: controller.currentIndex.value == i
                        ? Colors.blue.shade300
                        : const Color.fromRGBO(0, 0, 0, 0),
                    showBorder: true,
                    borderColor: controller.currentIndex.value == i
                        ? Colors.blue.shade300
                        : Colors.grey.withOpacity(.5),
                    borderRadius: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Row(
                        children: [
                          Text(
                            travelListType[i].toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: controller.currentIndex.value == i
                                        ? Colors.white
                                        : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(
          height: Sizes.spaceBtn,
        ),

        //respective airport lists by travel (domestic or international)
        // hintTxt.toLowerCase=="arrival" && controller.getIndexByValue(bookController.departure.value)==controller.currentIndex.value? null:
        Obx(
          () => AirportListsDropdown(
            cities:
            //  hintTxt.toLowerCase() == "arrival" && controller.getIndexByValue(bookController.departure.value)==controller.currentIndex
                controller
                    .travelAttributes[controller.currentIndex.value].values,
            hintTxt: hintTxt,
          ),
        ),

        const SizedBox(
          height: 300,
        )

        // Obx(() => AirportLists(
        //     travelLists: controller
        //         .filteredAirportList[controller.currentIndex.value].values,
        //     title: controller
        //         .filteredAirportList[controller.currentIndex.value].name))
      ],
    );
  }
}
