import 'package:booktickets/trips/controllers/home/trip/bookingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../bookContainer.dart';

class DateComponent extends StatelessWidget {
  const DateComponent({super.key, required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final bookController = Get.put(BookingController());

    return BookContainer(
      ontap: () {
        bookController.selectDatePopUp(context);
      },
      icon: const Icon(
        Iconsax.calendar,
        color: Colors.grey,
      ),
      txtLabel: "Departure Date",
      // child: Text(
      //   DateFormat.yMMMd().format(DateTime.now()),
      //   style: Theme.of(context)
      //       .textTheme
      //       .headlineSmall!
      //       .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
      // )
      child: SizedBox(
        height: 20,
        child: GestureDetector(
          onTap: () {
            bookController.selectDatePopUp(context);
          },
          child: TextFormField(
            keyboardType: TextInputType.datetime,
            enableInteractiveSelection: false,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
            controller: bookController.departureDate,
            readOnly: true,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 7),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                counter: SizedBox.shrink()),
          ),
        ),
      ),
    );
  }
}
