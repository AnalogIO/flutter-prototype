import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Numpad extends StatefulWidget {
  final bool showNumpad;
  const Numpad(this.showNumpad);

  @override
  NumpadState createState() => NumpadState();
}

class NumpadState extends State<Numpad> {
  bool _fingerprintButton = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.showNumpad,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Padding(
        padding: EdgeInsets.only(top: 12, bottom: 24),
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
                NumpadButton("x"),
                NumpadButton("0"),
                NumpadButton("x"),
              ],
            )
          ],
        )
      ),
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String _text;
  NumpadButton(text) : this._text = text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        HapticFeedback.lightImpact();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Text(
          _text,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
        )
      )
    );
  }
}
