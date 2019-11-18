import 'package:analog_app/utils/login_pages.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  final LoginPages page;
  LoginTitle(this.page);

  @override
  Widget build(BuildContext context) {
    String title;
    if (page == LoginPages.email) title = "Sign in";
    if (page == LoginPages.password) title = "Kian";
    if (page == LoginPages.registerEmail) title = "Register";

    return Padding(
      padding: EdgeInsets.only(top: 32/*24*/, bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
