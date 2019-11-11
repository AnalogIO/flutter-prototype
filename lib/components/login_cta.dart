import 'package:flutter/material.dart';

class LoginCTA extends StatelessWidget {
  final String _text;
  LoginCTA(text) : this._text = text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){},
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
