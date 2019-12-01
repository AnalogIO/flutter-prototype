import 'package:flutter/material.dart';

import 'package:analog_app/components/tickets/ticket.dart';
import 'package:analog_app/components/section_title.dart';

const OWNED_TICKETS = [{'espresso': 2}];
const ALL_TICKETS = {
  'filter' : {
    'name': 'Filter Coffee',
    'desc': 'Used for filter coffee brewed with fresh ground coffee',
    'price': 80
  },
  'espresso': {
    'name': 'Espresso Based',
    'desc': 'Used for specialities like espresso, cappuccino, caffe latte, cortado, americano, chai latte, iced coffee and iced latte.',
    'price': 150
  },
  'tea' : {
    'name': 'Tea',
    'desc': 'Used for our large collection of organic tea',
    'price': 50
  },
  'syrup' : {
    'name': 'Syrup',
    'desc': 'Used for syrup',
    'price': 10
  }
};

class TicketsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        SectionTitle("My tickets"),
        Ticket(
          title: ALL_TICKETS['espresso']['name'],
          description: ALL_TICKETS['espresso']['desc'],
          ownedAmount: OWNED_TICKETS[0]['espresso']
        ),
        Ticket(
          title: ALL_TICKETS['tea']['name'],
          description: ALL_TICKETS['tea']['desc'],
          ownedAmount: 17
        ),
        SectionTitle(
          "Buy Tickets",
          SectionTitleSideButton()
        ),
        Ticket(
          title: ALL_TICKETS['filter']['name'],
          description: ALL_TICKETS['filter']['desc'],
          ownedAmount: 0
        ),
        Ticket(
          title: ALL_TICKETS['syrup']['name'],
          description: ALL_TICKETS['syrup']['desc'],
          ownedAmount: 0
        )
      ],
    );
  }
}
