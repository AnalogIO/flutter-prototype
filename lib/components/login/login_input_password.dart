import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/login_state.dart';

class LoginInputPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, loginState, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PasswordCircle(1, loginState.password.length),
            PasswordCircle(2, loginState.password.length),
            PasswordCircle(3, loginState.password.length),
            PasswordCircle(4, loginState.password.length)
          ],
        );
      }
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

    Color fill = Color(0xffFAFAFA);
    if (filled) fill = Colors.orange;
    if (current) fill = Colors.blue;

    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(50)
      )
    );
  }
}