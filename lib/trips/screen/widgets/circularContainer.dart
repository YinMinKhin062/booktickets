import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer(
      {super.key,
      this.width,
      this.height,
      this.borderRadius = 0,
      this.showBorder = false,
      this.borderColor = Colors.transparent,
      this.bgColor = Colors.white,
      this.showBoxshadow = false,
      this.margin = 0,
      this.padding,
      this.child});

  final double? width;
  final double? height;
  final Widget? child;
  // final BorderRadiusGeometry? borderRadius;
  final double borderRadius;
  final bool showBorder;
  final Color borderColor;
  final Color bgColor;
  final bool showBoxshadow;
  final double margin;
  final EdgeInsetsGeometry ?padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding: padding,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: showBorder ? Border.all(color: borderColor) : null,
          boxShadow: showBoxshadow
              ? [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: const Offset(5, 5),
                      blurRadius: 10,
                      spreadRadius: 2),
                  const BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                      blurRadius: 0,
                      spreadRadius: 0)
                ]
              : null),
      width: width,
      height: height,
      child: child,
    );
  }
}
