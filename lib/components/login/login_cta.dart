import 'package:analog_app/utils/login_pages.dart';
import 'package:flutter/material.dart';

class LoginCTA extends StatelessWidget {
  final LoginPages page;
  final Function changePageFunction;
  const LoginCTA(this.page, this.changePageFunction);

  @override
  Widget build(BuildContext context) {
    String text = "";
    Function changePage;

    if (page == LoginPages.email) {
      text = "Don't have an account? Make one >>";
      changePage = () => changePageFunction(LoginPages.registerEmail);
    }
    if (page == LoginPages.password) {
      text = "Sign in using another account >>";
      changePage = () => changePageFunction(LoginPages.email);
    }
    if (page == LoginPages.registerEmail) {
      text = "I already have an account >>";
      changePage = () => changePageFunction(LoginPages.email);
    }

    return FlatButton(
      onPressed: () => changePage(),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline
        ),
      ),
    );
  }
}
