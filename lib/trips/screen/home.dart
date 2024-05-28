import 'package:booktickets/trips/controllers/home/tripTypesController.dart';
import 'package:booktickets/trips/screen/homeWidgets/headerSection.dart';
import 'package:booktickets/trips/screen/homeWidgets/tripTypeTabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../constants/Sizes.dart';
import '../../drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final triptypescontroller = Get.put(TripTypesController());

    return Scaffold(
      drawer: const MyDrawer(),
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                //header img, drawer & search box
                HeaderSection(),

                SizedBox(
                  height: Sizes.spaceBtn,
                  // height: Sizes.defaultSpace * 2,
                ),

                TripTypeTabBar(TripTypes: ["One Way", "Round Trip"]),

                SizedBox(height: Sizes.spaceBtn),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
