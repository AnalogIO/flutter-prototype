import 'package:analog_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class LoginCTA extends StatelessWidget {
  final String _text;
  final Function changePageFunction;
  const LoginCTA(this._text, this.changePageFunction);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => changePageFunction(LoginPageStatus.registerEmail),
      child: Text(
        _text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline
        ),
      ),
    );
  }
}
