import 'package:flutter/material.dart';
import 'package:analog_app/utils/colors.dart';
import 'package:analog_app/components/tappable.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Widget sideWidget;
  SectionTitle(
    this.title,
    [this.sideWidget]
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8/*12*/),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          ),
          Container(child: sideWidget)
        ],
      ),
    );
  }
}

class SectionTitleSideButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tappable(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(8),
      padding: EdgeInsets.fromLTRB(12, 6, 8, 6),
      onTap: () => null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Redeem voucher",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6),
            child: Icon(
              Icons.arrow_forward,
              color: AppColors.white,
              size: 16,
            ),
          )
        ],
      )
    );
  }
}
