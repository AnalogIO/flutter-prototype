import 'package:analog_app/utils/login_pages.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  final LoginPages page;
  final String loginEmail;
  LoginTitle(this.page, this.loginEmail);

  @override
  Widget build(BuildContext context) {
    String title;
    if (page == LoginPages.email) title = "Sign in";
    if (page == LoginPages.password) title = loginEmail;
    if (page == LoginPages.registerEmail) title = "Register";

    return Padding(
      padding: EdgeInsets.only(top: 32, bottom: 16),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
