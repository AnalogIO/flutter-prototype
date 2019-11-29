import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/colors.dart';
import 'package:analog_app/utils/login_state.dart';

class LoginInputPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, s, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PasswordCircle(1, s.password.length, s.errorText.isNotEmpty),
            PasswordCircle(2, s.password.length, s.errorText.isNotEmpty),
            PasswordCircle(3, s.password.length, s.errorText.isNotEmpty),
            PasswordCircle(4, s.password.length, s.errorText.isNotEmpty)
          ],
        );
      }
    );
  }
}

class PasswordCircle extends StatelessWidget {
  final int _circleIndex;
  final int _passwordLength;
  final bool _isError;
  const PasswordCircle(
    this._circleIndex,
    this._passwordLength,
    this._isError
  );

  @override
  Widget build(BuildContext context) {
    bool current = _circleIndex == _passwordLength + 1;
    bool previous = _circleIndex <= _passwordLength;

    Color fill = AppColors.white;
    if (current || previous) fill = AppColors.creamDarker;

    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: (current || _isError) ? 4 : 0,
          color: (_isError)
            ? AppColors.orange
            : AppColors.white
        )
      )
    );
  }
}
