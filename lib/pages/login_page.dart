import 'package:flutter/material.dart';

import '../components/login/login_image.dart';
import '../components/login/login_title.dart';
import '../components/login/login_form.dart';
import '../components/login/login_input_hint.dart';
import '../components/login/login_cta.dart';
import '../components/login/login_numpad.dart';

import '../utils/Request.dart';
import '../utils/enums.dart';

// TODO Login loading animation/indicator
// TODO Fix password circles buttons
// TODO Global color vars
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
          IconButton(icon: Icon(
            Icons.help_outline),
            onPressed: (){} // TODO Add debug helper function
          )
        ]
      ),
      body: Container(
        color: Color(0xff362619),
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
        color: Color(0xff362619),
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
