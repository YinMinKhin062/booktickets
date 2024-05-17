import 'package:booktickets/constants/Sizes.dart';
import 'package:booktickets/trips/controllers/home/trip/bookingController.dart';
import 'package:booktickets/trips/screen/homeWidgets/tripForm/tripFormComponents/FromToComponent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tripForm/tripFormComponents/PassengerAndClass.dart';
import 'tripForm/tripFormComponents/dateComponent.dart';

class OneWayBookingForm extends StatelessWidget {
  const OneWayBookingForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FromToComponent(),
        const SizedBox(
          height: Sizes.spaceBtn,
        ),

        //Departure Date
        DateComponent(
          dateTime: DateTime.now(),
        ),

        const SizedBox(
          height: Sizes.spaceBtn,
        ),

        //Passenger & Class
        const PassengerAndClass(),

        const SizedBox(
          height: Sizes.defaultSpace,
        ),

        //btn
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Search Flight",
                )))
      ],
    ));
  }
}
