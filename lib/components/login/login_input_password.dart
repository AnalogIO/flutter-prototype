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

    Color fill = AppColors.white.withAlpha(70);

    double opacity = 1; // TODO Use
    double borderWidth = 0;
    Color borderColor = Colors.transparent;

    if (current) {
      opacity = 0;
      // borderColor = AppColors.creamLighter;
      // borderWidth = 4;
    }
    if (previous) {
      fill = AppColors.white;
      // borderColor = AppColors.coffee;
      // borderWidth = 12;
    }
    if (isError) {
      fill = AppColors.highlight;
      // borderColor = AppColors.orange;
      // borderWidth = 4;
    }

    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: fill,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth
        )
      )
    );
  }
}
