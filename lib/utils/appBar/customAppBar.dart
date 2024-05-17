import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.statusbarColor = Colors.transparent,
      this.statusbarbrightness = Brightness.light,
      this.preferredsize = const Size.fromHeight(kToolbarHeight)});

  final Widget? title;
  final Size preferredsize;
  final Color statusbarColor;
  final Brightness statusbarbrightness;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusbarColor, // <-- SEE HERE
        statusBarIconBrightness:
            statusbarbrightness, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => preferredsize;
}
