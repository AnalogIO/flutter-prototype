import 'package:flutter/material.dart';

import '../components/login/login_image.dart';
import '../components/login/login_title.dart';
import '../components/login/login_input.dart';
import '../components/login/login_input_password.dart';
import '../components/login/login_input_hint.dart';
import '../components/login/login_cta.dart';
import '../components/login/login_numpad.dart';

import '../utils/Request.dart';
import '../utils/enums.dart';

// TODO Login loading animation/indicator
// TODO App state
// TODO Small animations
// TODO Fix password circles buttons

class LoginPage extends StatefulWidget {
  // constructor. need?
  // final LoginPages loginPage;
  // const LoginPage(this.loginPage);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPages _loginPage = LoginPages.email;
  String _inputEmail = "";
  String _inputPassword = "";
  String _inputError = "";

  // Email
  void _setInputEmail(String newEmail) {
    setState(() {_inputEmail = newEmail;} );
  }

  // Password
  String _getInputPassword() => _inputPassword;
  void _updateInputPassword(String number) {
    if (_inputPassword.length < 4) {
      setState(() {_inputPassword = _inputPassword + number;} );

      if (_inputPassword.length == 4) {
        _login(_inputEmail, _inputPassword);
      }
    }
  }
  void _resetInputPassword({bool clearError = true}) {
    setState(() {
      _inputPassword = "";
      if (clearError) _inputError = "";
    });
  }

  // Login
  void _login(String email, String password) async {
    final response = await Request.makeRequestJson("/API/V1/user", "post", {
      "email": email,
      "password": password
    });

    if (response == null) {
      debugPrint('FAILURE -- RESPONSE NULL');
      return;
    }

    if (response["statusCode"] == "200" && response["jsonBody"]["token"] != null) {
      // handle success
      debugPrint(response.toString());
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // handle failure
      debugPrint('FAILURE');
      debugPrint(response.toString());
      _setInputError(response["jsonBody"]["message"]);
      _resetInputPassword(clearError: false);
    }
  }

  // Other page state
  void _changePage(LoginPages newPage) {
    _resetInputPassword();
    setState(() {
      _loginPage = newPage;
    });
  }

  void _setInputError(String message) {
    setState(() {
      _inputError = message;
    });
  }

  // Helper debug function only
  void _onHelpPressed() {
    if (_loginPage == LoginPages.email) {
      _changePage(LoginPages.password);
    } else {
      _changePage(LoginPages.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool showEmailInput = _loginPage == LoginPages.email || _loginPage == LoginPages.registerEmail;

    Widget loginUpper = Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(60, 0, 60, 60),
        color: Color(0xff362619),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginImage(),
            LoginTitle(_loginPage, _inputEmail),
            Visibility(
              visible: showEmailInput,
              child: LoginForm(_loginPage, _changePage, _setInputEmail, _setInputError),
              replacement: LoginPasswordInput(_getInputPassword),
            ),
            LoginInputHint(_loginPage, _inputError),
            LoginCTA(_loginPage, _changePage)
          ],
        )
      )
    );

    return Scaffold(
      // keyboard doesn't push screen up
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.help_outline), onPressed: _onHelpPressed)
        ]
      ),
      body: Column(
        children: <Widget>[
          loginUpper,
          Text("${_loginPage.toString()} | $_inputEmail | ${_getInputPassword()}"),
          Numpad(_loginPage, _updateInputPassword, _resetInputPassword)
        ]
      ),
    );
  }
}
