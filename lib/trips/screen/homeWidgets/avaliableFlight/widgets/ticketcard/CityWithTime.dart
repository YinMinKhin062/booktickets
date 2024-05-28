import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class CityWithTime extends StatelessWidget {
  const CityWithTime({super.key, required this.cityName, required this.time});

  final String cityName;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cityName,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.white),
        ),
        Text(
          time,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.white),
        )
      ],
    );
  }
}
