import 'package:booktickets/trips/screen/home.dart';
import 'package:booktickets/utils/themes/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/get_navigation.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.myTheme,
      debugShowCheckedModeBanner: false,
      // home: const NavigationMenu(),
      home: const Home(),
    );
  }
}
