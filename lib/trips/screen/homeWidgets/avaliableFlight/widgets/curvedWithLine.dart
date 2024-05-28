import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class curvedWithLine extends StatelessWidget {
  const curvedWithLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        //top curved
        SizedBox(
          height: 7,
          width: 15,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)))),
        ),

        //dotted line
        Expanded(
          child: DottedLine(
            direction: Axis.vertical,
            dashColor: Colors.white,
          ),
        ),

        //bottom curved
        SizedBox(
          height: 7,
          width: 15,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)))),
        ),
      ],
    );
  }
}
