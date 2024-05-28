import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DottedLineWithIcon extends StatelessWidget {
  const DottedLineWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.rotate(
            angle: 45 * 3.14 / 90,
            child: Icon(
              Icons.flight,
              size: 20,
              color: Colors.white,
            )),
         Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            dashColor: Colors.white,
          ),
        ),
        Icon(
          Icons.location_on,
          size: 16,
          color: Colors.white,
        )
      ],
    );
  }
}
