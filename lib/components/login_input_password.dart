import 'package:flutter/material.dart';

class LoginPasswordInput extends StatelessWidget {
  final Function getPassword;
  const LoginPasswordInput(this.getPassword);

  @override
  Widget build(BuildContext context) {
    String _password = getPassword();
    int passwordLength = _password.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PasswordCircle(1, passwordLength),
        PasswordCircle(2, passwordLength),
        PasswordCircle(3, passwordLength),
        PasswordCircle(4, passwordLength)
      ],
    );
  }
}

class PasswordCircle extends StatelessWidget {
  final int _circleIndex;
  final int _passwordLength;
  const PasswordCircle(this._circleIndex, this._passwordLength);

  @override
  Widget build(BuildContext context) {
    bool current = _circleIndex == _passwordLength + 1;
    bool filled  = _circleIndex <= _passwordLength;
    Color fill = filled ? Colors.orange : Color(0xffFAFAFA);
    if (current) fill = Colors.blue;

    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(24)
      )
    );
  }
}