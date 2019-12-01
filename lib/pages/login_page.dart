import 'package:flutter/material.dart';
import 'package:analog_app/utils/colors.dart';

import '../components/login/login_image.dart';
import '../components/login/login_title.dart';
import '../components/login/login_form.dart';
import '../components/login/login_input_hint.dart';
import '../components/login/login_cta.dart';
import '../components/login/login_numpad.dart';

// TODO Login loading animation/indicator
// TODO Small animations
// TODO LoginPage class Stateless?

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // keyboard doesn't push screen up
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () => Navigator.pushReplacementNamed(context, "/home")
          )
        ]
      ),
      body: Container(
        color: AppColors.coffee,
        child: Column(
          children: <Widget>[
            LoginUpper(),
            Numpad()
          ]
        ),
      ),
    );
  }
}

class LoginUpper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(60, 0, 60, 60),
        color: AppColors.coffee,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginImage(),
            LoginTitle(),
            LoginForm(),
            LoginInputHint(),
            LoginCTA()
          ],
        )
      )
    );
  }
}
