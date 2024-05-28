import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:book_my_seat/book_my_seat.dart';

class BookSeat extends StatelessWidget {
  const BookSeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: SizedBox(
                    width: double.maxFinite,
                    height: 500,
                    child: SeatLayoutWidget(
                      stateModel: const SeatLayoutStateModel(
                        seatSvgSize: 45,
                          rows: 5,
                          cols: 3,
                          currentSeatsState: [
                            [
                              SeatState.disabled,
                              SeatState.sold,
                              SeatState.unselected,
                            ],
                            [
                              SeatState.unselected,
                              SeatState.selected,
                              SeatState.unselected,
                            ],
                            [
                              SeatState.unselected,
                              SeatState.selected,
                              SeatState.sold,
                            ],
                            [
                              SeatState.unselected,
                              SeatState.selected,
                              SeatState.sold,
                            ],
                            [
                              SeatState.selected,
                              SeatState.sold,
                              SeatState.unselected,
                            ],
                          ],
                          pathSelectedSeat: "assets/images/seats/selected.svg",
                          pathDisabledSeat: "assets/images/seats/selected.svg",
                          pathSoldSeat: "assets/images/seats/selected.svg",
                          pathUnSelectedSeat:
                              "assets/images/seats/selected.svg"),
                      onSeatStateChanged: (rowI, colI, currentState) {},
                    )))
          ],
        ),
      ),
    );
  }
}
