import 'package:flutter/material.dart';
import 'package:analog_app/utils/colors.dart';

class TicketDots extends StatelessWidget {
  final int amountOwned;
  const TicketDots({this.amountOwned});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
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
        ),
        Visibility(
          visible: (amountOwned > 10),
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "+" + (amountOwned - 10).toString(),
              style: TextStyle(
                color: AppColors.coffee,
                fontFamily: "monospace",
                fontSize: 14,
                fontWeight: FontWeight.w500
              )
            ),
          ),
        )
      ],
    );
  }
}
