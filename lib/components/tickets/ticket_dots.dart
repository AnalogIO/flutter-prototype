import 'package:flutter/material.dart';
import 'package:analog_app/utils/colors.dart';

// TODO FIX THIS SHIT -- BOTTOM PIXEL CUT OFF/ODD SIZING

class TicketDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 30,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        primary: false,
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 2,
        children: List.generate(10, (index) {
          return Container(
            width: 14, // does nothing
            height: 14, // does nothing
            decoration: BoxDecoration(
              color: AppColors.coffeeLighter,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.coffee,
                width: 2
              )
            ),
          );
        }),
      )
    );
  }
}
