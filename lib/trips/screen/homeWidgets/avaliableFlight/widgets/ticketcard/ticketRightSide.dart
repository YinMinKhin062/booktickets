import 'package:booktickets/trips/screen/homeWidgets/seat/bookSeat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/Sizes.dart';
import '../../../../widgets/circularContainer.dart';
import 'CityWithTime.dart';
import 'dottedlineIcon.dart';

class ticketRightSide extends StatelessWidget {
  const ticketRightSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10.0,
        bottom: 10.0,
        right: 15.0,
      ),
      child: Column(
        children: [
          //to and from
          Row(
            children: [
              const CityWithTime(cityName: "Bagan", time: "10am"),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                  child: Column(
                children: const [
                  DottedLineWithIcon(),
                ],
              )),
              const SizedBox(
                width: 6,
              ),
              const CityWithTime(cityName: "Yangon", time: "10am"),
            ],
          ),
          const SizedBox(
            height: Sizes.spaceBtn / 2,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //price
              Text(
                "100,000 Ks",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.white),
              ),

              //book seat
              GestureDetector(
                onTap: () {
                  Get.to(const BookSeat());
                },
                child: CircularContainer(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  borderRadius: 10,
                  bgColor: Colors.white,
                  child: Text(
                    "Choose",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Colors.blue.shade300),
                  ),
                ),
              ),

              //detail
              GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "Details",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      CircularContainer(
                        borderRadius: 10,
                        showBoxshadow: true,
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue.shade300,
                          size: 10,
                        ),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
