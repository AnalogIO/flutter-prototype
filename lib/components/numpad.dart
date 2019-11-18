import 'package:analog_app/utils/login_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Numpad extends StatefulWidget {
  final LoginPages _page;
  final Function _updateInputPassword;
  const Numpad(this._page, this._updateInputPassword);

  @override
  NumpadState createState() => NumpadState();
}

class NumpadState extends State<Numpad> {
  // bool _fingerprintButton = true;

  @override
  Widget build(BuildContext context) {
    Widget numpadButton(String text, [bool updatePassword = true]) {
      return FlatButton(
        onPressed: () {
          HapticFeedback.lightImpact();
          if (updatePassword) widget._updateInputPassword(text);
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
                numpadButton("x", false),
                numpadButton("0"),
                numpadButton("x", false),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class numpadButton extends StatelessWidget {
//   final String _text;
//   numpadButton(this._text);

//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       onPressed: () {
//         HapticFeedback.lightImpact();
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//         child: Text(
//           _text,
//           style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
//         )
//       )
//     );
//   }
// }
