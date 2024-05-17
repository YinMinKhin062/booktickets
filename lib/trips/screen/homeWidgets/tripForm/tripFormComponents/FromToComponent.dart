import 'package:booktickets/trips/controllers/home/trip/bookingController.dart';
import 'package:booktickets/trips/screen/widgets/circularContainer.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../constants/Sizes.dart';
import '../bookContainer.dart';

class FromToComponent extends StatelessWidget {
  const FromToComponent({super.key});

  // final String fromTxt;
  // final String toTxt;

  @override
  Widget build(BuildContext context) {
    final bookController = Get.put(BookingController());
    return Stack(
      children: [
        Column(
          children: [
            //From
            BookContainer(
              //icon
              icon: Column(
                children: [
                  Transform.rotate(
                      angle: 180 * 3.14 / 180,
                      child: const Icon(
                        Icons.flight,
                        size: 20,
                        color: Colors.grey,
                      )),
                  const SizedBox(
                    height: 20,
                    child: DottedLine(
                      direction: Axis.vertical,
                      // dashLength: 4,
                      dashColor: Colors.grey,
                    ),
                  )
                ],
              ),

              txtLabel: 'From',
              child: Obx(
                () => Text(
                  bookController.departure.value,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              ontap: () {
                bookController.selectedAirportPopup(context, "Departure",
                    Icons.flight_takeoff, "Departure City or Airport");
              },
            ),

            const SizedBox(
              height: Sizes.spaceBtn,
            ),

            //To
            BookContainer(
              ontap: () {
                bookController.selectedAirportPopup(context, "Arrival",
                    Icons.flight_land, "Arrival City or Airport");
              },
              //icon
              icon: Column(
                children: const [
                  SizedBox(
                    height: 20,
                    child: DottedLine(
                      direction: Axis.vertical,
                      // dashLength: 4,
                      dashColor: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),

              txtLabel: "To",
              child: Obx(
                () => Text(
                  bookController.arrival.value,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 50,
          right: 25,
          child: GestureDetector(
            onTap: () {
              bookController.swapAirportOrCity();
            },
            child: CircularContainer(
              bgColor: Colors.blue.shade300,
              borderRadius: 20,
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Iconsax.arrow_swap,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
