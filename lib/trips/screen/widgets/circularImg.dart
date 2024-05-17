import 'package:booktickets/trips/screen/widgets/circularContainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularImg extends StatelessWidget {
  const CircularImg(
      {super.key,
      required this.image,
      required this.radius,
      this.showBorder,
      this.borderColor,
      this.width = 50,
      this.height = 50});

  final String image;
  final double radius;
  final double width;
  final double height;
  final bool? showBorder;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      width: width,
      height: height,
      borderRadius: radius,
      showBorder: showBorder!,
      borderColor: borderColor!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            width: width,
            height: height,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Colors.black,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
