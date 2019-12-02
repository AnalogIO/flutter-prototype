// import 'package:analog_app/utils/enums.dart';
// import 'package:flutter/foundation.dart'; TODO needed?
import 'package:flutter/material.dart';

class TicketsState extends ChangeNotifier {
  String _token = "";
  String _username = "";
  Key _selectedTicket;

  Key get selectedTicket => _selectedTicket;
  set selectedTicket(Key k) {
    _selectedTicket = k;
    notifyListeners();
  }
}
