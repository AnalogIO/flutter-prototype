import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/colors.dart';
import 'package:analog_app/utils/login_state.dart';

import 'package:flutter/services.dart'; // Haptic feedback

enum NumpadActions {
  add,
  reset,
  biometric,
  forgot
}

class Numpad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, state, child) {
        return Container(
          color: (state.isPageEmail)
            ? AppColors.primary
            : AppColors.white,
          padding: EdgeInsets.only(top: 16, bottom: 24),
          child: Visibility(
            visible: !state.isPageEmail,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(color: AppColors.lightGray, width: 2),
                  verticalInside: BorderSide(color: AppColors.lightGray, width: 2),
                ),
                children: <TableRow>[
                  TableRow(children: [
                    NumpadButton(text: "1"),
                    NumpadButton(text: "2"),
                    NumpadButton(text: "3")
                  ]),
                  TableRow(children: [
                    NumpadButton(text: "4"),
                    NumpadButton(text: "5"),
                    NumpadButton(text: "6")
                  ]),
                  TableRow(children: [
                    NumpadButton(text: "7"),
                    NumpadButton(text: "8"),
                    NumpadButton(text: "9")
                  ]),
                  TableRow(children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: NumpadButton(
                        icon: Icons.backspace,
                        action: NumpadActions.reset
                      )
                    ),
                    NumpadButton(text: "0"),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: NumpadButton(
                        icon: Icons.fingerprint,
                        action: NumpadActions.biometric
                      )
                    )
                  ]),
                ],
              ),
            )
          ),
        );
      }
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final NumpadActions action;
  NumpadButton({
    this.text,
    this.icon,
    this.action = NumpadActions.add
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, state, child) {
        return FlatButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            if (action == NumpadActions.reset) state.password = "";
            if (action == NumpadActions.add) {
              state.password += text;
              // TODO Handle login success /maybe make state.isLoggedIn?
              if (state.token.isNotEmpty) Navigator.pushReplacementNamed(context, "/home");
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: (icon != null)
              ? Icon(icon, size: 32)
              : Text(text, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
              )
          )
        );
      }
    );
  }
}
