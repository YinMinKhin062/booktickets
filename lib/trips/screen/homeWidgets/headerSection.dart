import 'package:booktickets/trips/screen/homeWidgets/tripTypeTabBar.dart';
import 'package:booktickets/trips/screen/widgets/circularContainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/imgContents.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                  image:
                      CachedNetworkImageProvider(ImgContents.homeFlightImg1))),
        ),

        //drawer menu
        Builder(builder: (context) {
          return Positioned(
              top: 30,
              left: 5,
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu_open,
                  color: Colors.white,
                  size: 23,
                ),
              ));
        }),

        //noti
        Positioned(
            top: 30,
            right: 5,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.notification,
                  color: Colors.white,
                  size: 20,
                ))),

        //search
        // Positioned(
        //   bottom: -25,
        //   left: 20,
        //   child: CircularContainer(
        //     borderRadius: 20,
        //     showBoxshadow: true,
        //     width: MediaQuery.of(context).size.width * .9,
        //     borderColor: Colors.black,
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        //       child: Row(
        //         children: [
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           const Icon(
        //             Icons.search_outlined,
        //             size: 25,
        //             color: Colors.grey,
        //           ),
        //           const SizedBox(
        //             width: 15,
        //           ),
        //           Text(
        //             "Search",
        //             style: Theme.of(context)
        //                 .textTheme
        //                 .bodyLarge!
        //                 .copyWith(color: Colors.grey),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
