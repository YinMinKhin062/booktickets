import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../constants/Sizes.dart';
import '../../../../controllers/home/trip/bookingController.dart';
import 'horizontaldottedlinewithicon.dart';

class AvailableFlightHeaderSection extends StatelessWidget {
  const AvailableFlightHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    return Stack(
      children: [
        //blue background with rounded corner
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: Colors.blue.shade300,
            borderRadius:
                const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  // bottomLeft: Radius.circular(50),
                  ),
          ),
        ),

        //flight result txt
        Positioned(
            top: 28,
            left: 12,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Your Flight Search Results",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ],
            )),

        Positioned(
          top: 80,
          left: 35,
          child: routeSearchResult(controller: controller),
        ),

        Positioned(
          top: 135,
          left: 50,
          child: Row(
            children: [
              Text(
                controller.departureDate.text +
                    ", Passenger " +
                    controller.passenger.value,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}

class routeSearchResult extends StatelessWidget {
  const routeSearchResult({
    super.key,
    required this.controller,
  });

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //departure
        SizedBox(
          width: 75,
          child: Text(
            controller.departure.value,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
        ),

        const HorizonatalDottedLineWithIcon(),

        SizedBox(
          width: 75,
          child: Text(controller.arrival.value,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}
