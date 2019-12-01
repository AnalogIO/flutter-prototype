import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/colors.dart';
import 'package:analog_app/utils/login_state.dart';

class LoginInputPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, state, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (i) {
            return PasswordCircle(
              index: i,
              passwordLength: state.password.length,
              isError: state.errorText.isNotEmpty
            );
          })
        );
      }
    );
  }
}

class PasswordCircle extends StatelessWidget {
  final int index;
  final int passwordLength;
  final bool isError;
  const PasswordCircle({
    this.index,
    this.passwordLength,
    this.isError
  });

  @override
  Widget build(BuildContext context) {
    bool current = index == passwordLength;
    bool previous = index < passwordLength;

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
          width: (current || isError) ? 4 : 0,
          color: (isError)
            ? AppColors.orange
            : AppColors.white
        )
      )
    );
  }
}
