import 'dart:ffi';

import 'package:booktickets/trips/controllers/home/trip/bookingController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class classofFlightList extends StatelessWidget {
  const classofFlightList(
      {super.key, required this.flightClassLists, this.onTap});

  final List<String> flightClassLists;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());

    return ListView.builder(
        itemCount: flightClassLists.length,
        itemBuilder: (context, index) {
          return ListTile(
            dense: true,
            minVerticalPadding: 0,
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.symmetric(vertical: 4),
            title: Text(flightClassLists[index]),
            trailing: controller.selectedFlightIndex.value == index
                ? Icon(
                    Icons.check_circle,
                    color: Colors.blue.shade300,
                  )
                : null,
            onTap: () {
              controller.selectedFlightIndex.value = index;
              controller.classofFlight.value = flightClassLists[index];
              Get.back();
            },
          );
        });
  }
}
