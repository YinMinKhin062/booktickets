import 'package:booktickets/trips/controllers/home/trip/bookingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/Sizes.dart';
import '../bookContainer.dart';

class PassengerAndClass extends StatelessWidget {
  const PassengerAndClass({super.key});

  @override
  Widget build(BuildContext context) {
    final bookController = Get.put(BookingController());
    return Row(
      children: [
        //Passenger
        Flexible(
          child: BookContainer(
              ontap: () {
                bookController.selectPassenger(context);
              },
              icon: const Icon(
                Icons.person,
                color: Colors.grey,
                // size: 20,
              ),
              txtLabel: "Passenger",
              child: Obx(
                () => Text(
                  bookController.passenger.value,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              )),
        ),
        const SizedBox(
          width: Sizes.spaceBtn,
        ),

        //Class
        Flexible(
          child: BookContainer(
              ontap: () => bookController.selectClassPopUp(context),
              icon: const Icon(
                Icons.chair,
                color: Colors.grey,
                // size: 20,
              ),
              txtLabel: "Class",
              child: Obx(
                () => Text(
                  bookController.classofFlight.value,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              )),
        ),
      ],
    );
  }
}
