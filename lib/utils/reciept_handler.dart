import 'package:flutter/material.dart';
import 'package:analog_app/components/tappable.dart';
import 'colors.dart';

abstract class RecieptHandler {
  static Future showReciept(BuildContext context) async {
    return showDialog(
      context: context,
      // barrierDismissible: true,
      builder: (context) {
        return Tappable(
          onTap: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 0, 0, 0.8),
          child: SimpleDialog(
            semanticLabel: "Reciept",
            contentPadding: EdgeInsets.all(24),
            children: <Widget>[
              Text(
                "Ticket used",
                style: TextStyle(
                  color: AppColors.coffee,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 12),
                child: Text(
                  "Name of drink :)",
                  style: TextStyle(
                    color: AppColors.coffee,
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
                "Just now",
                style: TextStyle(
                  color: AppColors.coffee,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Friday 6/12 2019 14:31",
                style: TextStyle(
                  color: AppColors.coffee,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, bottom : 86, right: 86),
                child: Text(
                  "This can be found\nagain under Reciepts.",
                  softWrap: true,
                  style: TextStyle(
                    color: AppColors.coffeeLighter,
                    fontSize: 12
                  ),
                ),
              ),
              Text(
                "Tap anywhere to dismiss",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: AppColors.coffee,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24)))
          ),
        );
      }
    );
  }

}