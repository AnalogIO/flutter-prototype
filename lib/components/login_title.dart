import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  final String _title;
  LoginTitle(title) : this._title = title;

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
