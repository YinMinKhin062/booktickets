import 'package:booktickets/trips/controllers/home/trip/bookingController.dart';
import 'package:booktickets/trips/screen/homeWidgets/avaliableFlight/widgets/horizontaldottedlinewithicon.dart';
import 'package:booktickets/trips/screen/widgets/circularContainer.dart';
import 'package:booktickets/utils/appBar/customAppBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/Sizes.dart';
import '../../../../constants/imgContents.dart';
import '../../../../utils/shadowStyle/shadowStyle.dart';
import 'widgets/HeadSectionAvailableFlight.dart';
import 'widgets/ticketCard.dart';

class AvailableFlight extends StatelessWidget {
  const AvailableFlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue.shade300,
      body: Column(
        children: [
          const AvailableFlightHeaderSection(),
          // const SizedBox(
          //   height: Sizes.spaceBtn/2,
          // ),
          Expanded(
            child: Container(
              // decoration: BoxDecoration(
              //     boxShadow: ShadowStyle.horizontalShadow,
              //     // color: Colors,
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(50),
              //       topRight: Radius.circular(50),
              //     )),
              padding:
                  const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // TicketCard()
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) => const TicketCard(),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: Sizes.spaceBtn,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
