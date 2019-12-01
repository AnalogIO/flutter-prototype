import 'package:analog_app/components/tickets/ticket_dots.dart';
import 'package:flutter/material.dart';
import 'package:analog_app/utils/colors.dart';

class Ticket extends StatefulWidget {
  final String title;
  final String desc;
  final int ownedAmount;
  
  Ticket(
    this.title,
    this.desc,
    this.ownedAmount
  );

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  bool get owned => widget.ownedAmount > 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
              color: AppColors.coffee,
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, right: 40),
            child: Text(
              widget.desc,
              style: TextStyle(
                color: AppColors.coffeeLighter,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Expanded(child: Container()),
          TicketFooter(owned, widget.ownedAmount)
        ],
      ),
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.fromLTRB(24, 24, 24, 18),
      decoration: BoxDecoration(
        color: (owned)
          ? AppColors.creamDarker
          : AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(
          color: (owned)
          ? AppColors.coffeeLighter
          : Color.fromRGBO(0, 0, 0, 0.15),
          offset: Offset(0, 3),
          blurRadius: 0,
          spreadRadius: 0,
        )]
      )
    );
  }
}

class TicketFooter extends StatelessWidget {
  final bool owned;
  final int ownedAmount;
  TicketFooter(
    this.owned,
    this.ownedAmount
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          child: (owned)
            ? Text("dots here")//TicketDots()
            : null
        ),
        TicketFooterText(owned, ownedAmount)
      ],
    );
  }
}

class TicketFooterText extends StatelessWidget {
  final bool owned;
  final int ownedAmount;
  TicketFooterText(
    this.owned,
    this.ownedAmount
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Text(
            (owned)
              ? "Tickets left"
              : "Buy X tickets",
            style: TextStyle(
              color: AppColors.coffee,
              fontSize: 16
            )
          ),
        ),
        Visibility(
          visible: !owned,
          child: Padding(
            padding: EdgeInsets.only(right: 4),
            child: Text(
              "DKK",
              style: TextStyle(
                color: AppColors.coffee,
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            )
          )
        ),
        Text(
          (owned)
            ? ownedAmount.toString()
            : "60",
          style: TextStyle(
            color: AppColors.coffee,
            fontSize: 46,
            fontWeight: FontWeight.bold
          )
        )
      ],
    );
  }
}
