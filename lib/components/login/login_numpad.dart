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

class Numpad extends StatefulWidget {
  @override
  NumpadState createState() => NumpadState();
}

class NumpadState extends State<Numpad> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, state, child) {
        return Container(
          color: (state.isPageEmail)
            ? AppColors.coffee
            : AppColors.cream,
          padding: EdgeInsets.only(top: 12, bottom: 24),
          child: Visibility(
            visible: !state.isPageEmail,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NumpadButton("1"),
                    NumpadButton("2"),
                    NumpadButton("3"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NumpadButton("4"),
                    NumpadButton("5"),
                    NumpadButton("6"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NumpadButton("7"),
                    NumpadButton("8"),
                    NumpadButton("9"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NumpadButton("?", NumpadActions.forgot),
                    NumpadButton("0"),
                    NumpadButton("x", NumpadActions.reset),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String text;
  final NumpadActions action;
  NumpadButton(
    this.text,
    [this.action = NumpadActions.add]
  );

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
              // TODO Handle login success
              if (state.token.isNotEmpty) Navigator.pushReplacementNamed(context, "/home");
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Text(
              text,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
            )
          )
        );
      }
    );
  }
}
