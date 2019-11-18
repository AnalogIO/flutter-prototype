import 'package:analog_app/utils/login_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum NumpadActions {
  add,
  reset,
  biometric,
  forgot
}

class Numpad extends StatefulWidget {
  final LoginPages _page;
  final Function _updatePassword;
  final Function _resetPassword;
  const Numpad(this._page, this._updatePassword, this._resetPassword);

  @override
  NumpadState createState() => NumpadState();
}

class NumpadState extends State<Numpad> {
  // bool _fingerprintButton = true;

  @override
  Widget build(BuildContext context) {
    Widget numpadButton(String text, [NumpadActions action = NumpadActions.add]) {
      return FlatButton(
        onPressed: () {
          HapticFeedback.lightImpact();
          if (action == NumpadActions.add) widget._updatePassword(text);
          if (action == NumpadActions.reset) widget._resetPassword();
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

    bool showNumpad = true;
    if (widget._page == LoginPages.email) showNumpad = false;
    if (widget._page == LoginPages.registerEmail) showNumpad = false;
    
    Color numpadBackground = Colors.transparent;
    if (!showNumpad) numpadBackground = Color(0xff362619);

    return Container(
      color: numpadBackground,
      padding: EdgeInsets.only(top: 12, bottom: 24),
      child: Visibility(
        visible: showNumpad,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                numpadButton("1"),
                numpadButton("2"),
                numpadButton("3"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                numpadButton("4"),
                numpadButton("5"),
                numpadButton("6"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                numpadButton("7"),
                numpadButton("8"),
                numpadButton("9"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                numpadButton("?", NumpadActions.forgot),
                numpadButton("0"),
                numpadButton("x", NumpadActions.reset),
              ],
            )
          ],
        ),
      ),
    );
  }
}
