import 'package:booktickets/trips/screen/widgets/circularContainer.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';



class HorizonatalDottedLineWithIcon extends StatelessWidget {
  const HorizonatalDottedLineWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return //line
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const DottedLine(
          direction: Axis.horizontal,
          lineLength: 50,
          dashColor: Colors.white,
        ),
        // const SizedBox(
        //   width: 5,
        // ),

        //icon
        CircularContainer(
          bgColor: Colors.white,
          borderRadius: 25,
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 6, right: 4),
          child: Transform.rotate(
              angle: 45 * 3.14 / 90,
              child: const Icon(
                Icons.flight,
                color: Colors.grey,
              )),
        ),
        // const SizedBox(
        //   width: 5,
        // ),

        //line
        const DottedLine(
          direction: Axis.horizontal,
          lineLength: 50,
          dashColor: Colors.white,
        )
      ],
    );
  }
}

