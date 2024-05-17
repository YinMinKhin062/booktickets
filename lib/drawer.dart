import 'package:booktickets/constants/imgContents.dart';
import 'package:booktickets/constants/txtContents.dart';
import 'package:booktickets/trips/screen/drawer/drawerListTile.dart';
import 'package:booktickets/trips/screen/widgets/circularImg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'constants/Sizes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(ImgContents.drawerImg),
                      fit: BoxFit.cover)
                  // gradient: LinearGradient(colors: [
                  //   // Colors.grey[50]!,
                  //   Colors.blueGrey,
                  //   Colors.white,
                  // ])
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //img
                  const CircularImg(
                    image: ImgContents.userImg,
                    radius: 50,
                    width: 80,
                    height: 80,
                    showBorder: true,
                    borderColor: Colors.white,
                  ),

                  const SizedBox(
                    height: Sizes.spaceBtn,
                  ),

                  //text
                  Text(
                    TxtContents.userName,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  )
                ],
              )),
          const listTileWidget(
            icon: Iconsax.home5,
            text: 'Home',
          ),
          const listTileWidget(
            icon: Icons.flight_takeoff,
            text: 'Flight',
          ),
          const listTileWidget(
            icon: Icons.settings,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
