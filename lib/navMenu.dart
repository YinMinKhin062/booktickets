import 'package:booktickets/trips/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(navigationController());
    return Scaffold(
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Obx(
                    () => GNav(
                      gap: 8,
                      activeColor: Colors.white,
                      tabBackgroundGradient: const LinearGradient(
                          colors: [Colors.blueGrey, Colors.lightBlueAccent]),
                      iconSize: 24,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      duration: const Duration(milliseconds: 400),
                      selectedIndex: controller.currentIndex.value,
                      onTabChange: (value) =>
                          controller.currentIndex.value = value,
                      tabBackgroundColor: Colors.grey[100]!,
                      color: Colors.black,
                      tabs: const [
                        GButton(
                          icon: Iconsax.home,
                          text: 'Home',
                        ),
                        GButton(
                          icon: Iconsax.airplane,
                          text: 'Flights',
                        ),
                        GButton(
                          icon: Iconsax.user,
                          text: 'Profile',
                        ),
                      ],
                    ),
                  )))),
      body: Obx(() => controller.screens[controller.currentIndex.value]),
    );
  }
}

class navigationController extends GetxController {
  Rx<int> currentIndex = 0.obs;

  final screens = [
    const Home(),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
}
