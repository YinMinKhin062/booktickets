import 'package:booktickets/constants/imgContents.dart';
import 'package:booktickets/trips/screen/homeWidgets/avaliableFlight/widgets/ticketcard/CityWithTime.dart';
import 'package:booktickets/trips/screen/widgets/circularContainer.dart';
import 'package:booktickets/trips/screen/widgets/circularImg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../constants/Sizes.dart';
import 'curvedWithLine.dart';
import 'ticketcard/dottedlineIcon.dart';
import 'ticketcard/ticketRightSide.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      bgColor: Colors.blue.shade300,
      height: 100,
      showBoxshadow: false,
      child: Row(
        children: const [
          //company img
          Padding(
            padding: EdgeInsets.only(
              top: 8.0,
              left: 10.0,
              bottom: 8.0,
              right: 8.0,
            ),
            child: CircularImg(
              image: ImgContents.airKbz,
              fit: BoxFit.contain,
              radius: 20,
              showBorder: true,
              borderColor: Colors.transparent,
            ),
          ),

          //curvedline
          curvedWithLine(),

          //Right container
          Expanded(child: ticketRightSide())
        ],
      ),
    );
  }
}
