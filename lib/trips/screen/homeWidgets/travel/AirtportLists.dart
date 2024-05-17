import 'package:booktickets/constants/Sizes.dart';
import 'package:booktickets/trips/controllers/home/trip/tripDropDownController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AirportLists extends StatelessWidget {
  const AirportLists({super.key, required this.travelLists, required this.title});

  final List<String> travelLists;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: Sizes.spaceBtn,
        ),

        //list of airport
        ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: travelLists.length,
            itemBuilder: (context, index) {
              if (index >= 0 && index < travelLists.length) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        travelLists[index],
                      ),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtn / 2,
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            }),

       
      ],
    );
  }
}
