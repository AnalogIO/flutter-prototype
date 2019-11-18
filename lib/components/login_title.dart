import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  final String title;
  LoginTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
