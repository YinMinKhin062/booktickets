import 'package:booktickets/trips/controllers/home/tripTypesController.dart';
import 'package:booktickets/trips/screen/homeWidgets/RoundTripBookingForm.dart';
import 'package:booktickets/trips/screen/homeWidgets/oneWayBookingForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/Sizes.dart';

import '../widgets/circularContainer.dart';

class TripTypeTabBar extends StatelessWidget {
  const TripTypeTabBar({super.key, required this.TripTypes});

  final List<String> TripTypes;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TripTypesController());

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < TripTypes.length; i++)
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
                            TripTypes[i].toUpperCase(),
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

        //form
        Obx(
          () => CircularContainer(
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.defaultSpace, vertical: Sizes.spaceBtn / 2),
              child: TripTypes[controller.currentIndex.value] == "One Way"
                  ? const OneWayBookingForm()
                  : const RoundTripBookingForm()),
        )
      ],
    );
  }
}
