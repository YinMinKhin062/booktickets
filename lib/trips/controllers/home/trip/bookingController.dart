import 'package:booktickets/trips/controllers/home/travelTypesController.dart';
import 'package:booktickets/trips/screen/homeWidgets/travelTabBar.dart';
import 'package:booktickets/trips/screen/homeWidgets/tripForm/AirportListsDropdown.dart';
import 'package:booktickets/trips/screen/homeWidgets/tripForm/searchWidget.dart';
import 'package:booktickets/trips/screen/homeWidgets/tripForm/tripFormComponents/addDeductWidget.dart';
import 'package:booktickets/trips/screen/homeWidgets/tripForm/tripFormComponents/classofFlightList.dart';
import 'package:booktickets/trips/screen/widgets/circularContainer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/Sizes.dart';
import '../../../screen/homeWidgets/travel/AirtportLists.dart';

class BookingController extends GetxController {
  static BookingController get instance => Get.find();

  TextEditingController departureDate = TextEditingController();

  final Rx<int> adult = 1.obs;
  final Rx<int> child = 0.obs;
  final Rx<String> passenger = "".obs;

  final Rx<String> classofFlight = "".obs;
  Rx<int> selectedFlightIndex = 0.obs;

  List<String> classofFlightLists = [
    "Economy",
    "Premium Economy",
    "Business",
    "First-class"
  ];

  final Rx<String> departure = "Yangon, Myanmar".obs;
  final Rx<String> arrival = "BKK, Myanmar".obs;

  final travelTypecontroller = Get.put(TravelTypesController());

  @override
  void onInit() {
    super.onInit();
    departureDate.text = DateFormat.yMMMd().format(DateTime.now());
    passenger.value = "1 adult";
    classofFlight.value = classofFlightLists[selectedFlightIndex.value];
  }

  void swapAirportOrCity() {
    var temp = departure.value;
    departure.value = arrival.value;
    arrival.value = temp;
  }

  Future<dynamic> selectPassenger(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //title
              const ModalTitleWidget(icon: Icons.person, title: "Passengers"),
              const SizedBox(
                height: Sizes.spaceBtn,
              ),

              //Adult
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Adults",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Obx(
                    () => AddDeductWidget(
                      value: adult.value.toString(),
                      add: () {
                        adult.value++;
                        if (kDebugMode) {
                          print(adult.value);
                        }
                      },
                      remove: () {
                        if (adult.value > 1) {
                          adult.value--;
                          if (kDebugMode) {
                            print(adult.value);
                          }
                        }
                      },
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: Sizes.spaceBtn,
              ),

              //child
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Child",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Obx(
                    () => AddDeductWidget(
                      value: child.value.toString(),
                      add: () {
                        child.value++;
                        if (kDebugMode) {
                          print(child.value);
                        }
                      },
                      remove: () {
                        if (child.value > 0) {
                          child.value--;
                          if (kDebugMode) {
                            print(child.value);
                          }
                        }
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: Sizes.defaultSpace,
              ),

              //btn
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (child.value > 1) {
                        passenger.value =
                            "${adult.value} adult, ${child.value} children";
                      } else if (child.value > 0) {
                        passenger.value =
                            "${adult.value} adult, ${child.value} child";
                      } else {
                        passenger.value = "${adult.value} adult";
                      }
                      Get.back();
                    },
                    child: const Text("Confirm")),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> selectClassPopUp(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalTitleWidget(icon: Icons.chair, title: "Select class"),
            const SizedBox(
              height: Sizes.spaceBtn,
            ),
            SizedBox(
              height: 150,
              child: classofFlightList(flightClassLists: classofFlightLists),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> selectDatePopUp(BuildContext context) async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue.shade300,
            ),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.blue.shade300)),
          ),
          child: child!,
        );
      },
    );
    if (pickDate != null) {
      departureDate.text = DateFormat.yMMMd().format(pickDate);
    }
  }

  Future<dynamic> selectedAirportPopup(
      BuildContext context, String txt, IconData icon, String hintTxt) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          top: Sizes.defaultSpace,
          left: Sizes.defaultSpace,
          right: Sizes.defaultSpace,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Modal Title
              ModalTitleWidget(
                icon: icon,
                title: txt,
              ),

              const SizedBox(
                height: Sizes.defaultSpace,
              ),

              TravelTabBar(
                travelListType: travelTypecontroller.travelTypesList,
                hintTxt: txt,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModalTitleWidget extends StatelessWidget {
  const ModalTitleWidget({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blue.shade300,
        ),
        const SizedBox(
          width: Sizes.spaceBtn,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600, color: Colors.blue.shade300),
        )
      ],
    );
  }
}
