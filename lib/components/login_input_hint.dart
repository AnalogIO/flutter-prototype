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
    String text = "";
    bool isError = false;

    if (widget._page == LoginPages.password || widget._page == LoginPages.registerPassword) {
      text = "Enter passcode";
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
        style: TextStyle(
          color: textColor,
          fontSize: 14
        ),
      ),
    );
  }
}
