import 'package:analog_app/utils/reciept_handler.dart';
import 'package:flutter/material.dart';
import 'package:analog_app/utils/colors.dart';
import 'package:analog_app/utils/tickets_state.dart';

import 'package:analog_app/components/loader.dart';
import 'package:analog_app/components/tappable.dart';
import 'package:analog_app/components/tickets/ticket_dots.dart';

import 'package:screen/screen.dart'; // Screen brightness
import 'package:flutter/services.dart'; // Haptic feedback
import 'package:provider/provider.dart';

class Ticket extends StatefulWidget {
  final String title;
  final String description;
  final int cost;
  final int bundleSize;
  final int ownedAmount;
  Ticket({
    @required this.title,
    @required this.description,
    @required this.cost,
    this.bundleSize = 10,
    this.ownedAmount,
  });

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  final _ticketKey = UniqueKey();

  bool get owned => widget.ownedAmount > 0;
  bool get selected {
    Key s = Provider.of<TicketsState>(context, listen: false).selectedTicket;
    return s == _ticketKey;
  }

  void spendTicket() {
    HapticFeedback.lightImpact();
    Provider.of<TicketsState>(context, listen: true).selectedTicket = _ticketKey;
  }
  void buyTicket() {
    HapticFeedback.lightImpact();
    // TODO Buy Ticket function
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Tappable(
        onTap: (owned)
          ? (!selected ? spendTicket : null)
          : buyTicket,
        borderRadius: BorderRadius.circular(24),
        color: (owned)
          ? AppColors.creamLighter
          : AppColors.white,
        boxShadow: [BoxShadow(
          color: (owned)
            ? AppColors.coffeeLighter
            : Color.fromRGBO(0, 0, 0, 0.15),
          offset: Offset(0, 3),
          blurRadius: 0,
          spreadRadius: 0,
        )],
        child: Container(
          height: 200,
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
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
                  widget.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.coffeeLighter,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Expanded(child: Container()), // Pushes TicketFooter to bottom
              TicketFooter(
                owned: owned,
                ownedAmount: widget.ownedAmount,
                cost: widget.cost,
                bundleSize: widget.bundleSize,
                selected: selected
              )
            ]
          )
        ),
      ),
    );
  }
}

class TicketFooter extends StatelessWidget {
  final bool owned;
  final int ownedAmount;
  final int cost;
  final int bundleSize;
  final bool selected;
  TicketFooter({
    this.owned,
    this.ownedAmount,
    this.cost,
    this.bundleSize,
    this.selected
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 250),
      crossFadeState: selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 600)),
        builder: (c, s) => s.connectionState == ConnectionState.done
          ? TicketFooterConfirm(false)
          : TicketFooterConfirm(true)
      ),
      secondChild: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: (owned)
              ? TicketDots(amountOwned: ownedAmount)
              : null
          ),
          TicketFooterText(
            owned: owned,
            ownedAmount: ownedAmount,
            cost: cost,
            bundleSize: bundleSize,
          )
        ],
      ),
    );
  }
}

class TicketFooterConfirm extends StatelessWidget {
  final bool waiting;
  TicketFooterConfirm(this.waiting);

  @override
  Widget build(BuildContext context) {

    Future onConfirm() async {
      // TODO Not correct way of resetting brightness
      double normalBrightness = await Screen.brightness;
      Provider.of<TicketsState>(context, listen: true).selectedTicket = null;
      Screen.setBrightness(1);
      await RecieptHandler.showReciept(context);
      // TODO Not correct way of resetting brightness
      Screen.setBrightness(normalBrightness);
      return null;
    }

    void onCancel() {
      Provider.of<TicketsState>(context, listen: true).selectedTicket = null;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,    
        children: <Widget>[
          Tappable(
            onTap: onCancel,
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.coffee,
              width: 2
            ),
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              child: Icon(
                Icons.clear,
                color: AppColors.coffee,
                size: 18,
              ),
            ),
          ),
          Container(width: 8),
          Tappable(
            onTap: (!waiting && Provider.of<TicketsState>(context, listen: false).selectedTicket != null)
              ? onConfirm
              : null,
            color: AppColors.coffee,
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 129,
              height: 39,
              alignment: Alignment.center,
              child: (waiting)
                ? Loader()
                : Text(
                  "Use Ticket",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TicketFooterText extends StatelessWidget {
  final bool owned;
  final int ownedAmount;
  final int cost;
  final int bundleSize;
  TicketFooterText({
    this.owned,
    this.ownedAmount,
    this.cost,
    this.bundleSize
  });

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
              : "Buy $bundleSize tickets",
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
            : cost.toString(),
          style: TextStyle(
            color: AppColors.coffee,
            fontSize: 46/*TODO Decide if 46 or 16*/,
            fontWeight: FontWeight.bold
          )
        )
      ],
    );
  }
}
