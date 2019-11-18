import 'package:flutter/material.dart';

// TODO Misleading name : numpad is the password input..
class LoginPasswordInput extends StatefulWidget {
  final Function getPassword;
  const LoginPasswordInput(this.getPassword);

  @override
  LoginPasswordInputState createState() => LoginPasswordInputState();
}

class LoginPasswordInputState extends State<LoginPasswordInput> {
  // List<int> _passcode = [];
  @override
  Widget build(BuildContext context) {
    String _password = widget.getPassword();
    int length = _password.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PasswordCircle(1, length),
        PasswordCircle(2, length),
        PasswordCircle(3, length),
        PasswordCircle(4, length)
      ],
    );
  }
}

class PasswordCircle extends StatelessWidget {
  int _circleIndex;
  int _passwordLength;
  PasswordCircle(this._circleIndex, this._passwordLength);

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