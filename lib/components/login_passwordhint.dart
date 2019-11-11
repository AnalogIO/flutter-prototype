import 'package:flutter/material.dart';
enum LoginInputType {Email, Password, FirstPassword, Register}

class LoginPasswordHint extends StatefulWidget {
  final LoginInputType type;
  LoginPasswordHint({Key key, this.type}): super(key: key);

  @override
  _LoginPasswordHintState createState() => _LoginPasswordHintState();
}

class _LoginPasswordHintState extends State<LoginPasswordHint> {
  @override
  Widget build(BuildContext context) {

    String text = "";
    if (widget.type == LoginInputType.Password || widget.type == LoginInputType.FirstPassword) {
      text = "Enter password";
    }
  
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14
        ),
      ),
    );
  }
}
