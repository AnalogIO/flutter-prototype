import 'package:flutter/material.dart';
import 'package:analog_app/utils/login_pages.dart';

class LoginInputHint extends StatefulWidget {
  final LoginPages _page;
  final String _errorMessage;
  LoginInputHint(this._page, this._errorMessage);

  @override
  _LoginInputHintState createState() => _LoginInputHintState();
}

class _LoginInputHintState extends State<LoginInputHint> {
  @override
  Widget build(BuildContext context) {
    String text = "\n";
    bool isError = false;

    if (widget._page == LoginPages.password || widget._page == LoginPages.registerPassword) {
      if (widget._errorMessage.isEmpty) {
        text = "Enter passcode\n";
      } else {
        text = widget._errorMessage;
        isError = true;
      }
    }

    if (widget._page == LoginPages.email && widget._errorMessage.isNotEmpty) {
      text = widget._errorMessage;
      isError = true;
    }

    Color textColor = isError ? Colors.orange : Colors.white;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: 14
        ),
      ),
    );
  }
}
