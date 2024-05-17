import 'package:booktickets/constants/Sizes.dart';
import 'package:booktickets/trips/screen/widgets/circularContainer.dart';
import 'package:flutter/material.dart';

class BookContainer extends StatelessWidget {
  const BookContainer(
      {super.key,
      required this.icon,
      required this.txtLabel,
      this.ontap,
      required this.child});

  final Widget icon;
  final String txtLabel;
  final Widget child;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: CircularContainer(
        borderRadius: 20,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        showBoxshadow: true,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          icon,
          const SizedBox(
            width: Sizes.spaceBtn / 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txtLabel,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: Sizes.spaceBtn / 3,
                ),
                child,
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
