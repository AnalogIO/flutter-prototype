import 'package:flutter/material.dart';
import 'package:analog_app/utils/colors.dart';

// TODO Fix all constructors (include Key)

class TicketDots extends StatelessWidget {
  final int amountOwned;

  const TicketDots({
    Key key,
    this.amountOwned
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 30,
      child: Wrap(
        verticalDirection: VerticalDirection.up,
        spacing: 4,
        runSpacing: 2,
        children: List.generate(10, (index) {
          return Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: (amountOwned > index)
                ? AppColors.coffeeLighter
                : Colors.transparent,
              border: Border.all(
                color: AppColors.coffee,
                width: 2
              )
            ),
          );
        }),
      ),
    );
  }
}
