import 'package:flutter/material.dart';
import '../components/login_image.dart';
import '../components/login_title.dart';
import '../components/login_input.dart';
import '../components/login_input_password.dart';
import '../components/login_input_hint.dart';
import '../components/login_cta.dart';
import '../components/numpad.dart';

import '../utils/Request.dart';
import '../utils/login_pages.dart';

class LoginPage extends StatefulWidget {
  // constructor. need?
  final LoginPages loginPage;
  const LoginPage(this.loginPage);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPages _loginPage = LoginPages.email;
  String _inputError = "";
  String _inputPassword = "";

  String _getInputPassword() => _inputPassword;
  void _updateInputPassword(String newPassword) {
    setState(() {_inputPassword = _inputPassword + newPassword;} );

    if (_inputPassword.length >= 4) {
      // TODO Handle complete password
      _resetInputPassword();
    }
  }
  void _resetInputPassword() {
    setState(() {_inputPassword = "";} );
  }

  void _login(String email, int password) async {
    final response = await Request.makeRequest("/test");

    if (response.statusCode == 200) {
    } else {
      Navigator.pushNamed(context, "/");
    }
  }

  // Helper debug function only
  void _onHelpPressed() {
    if (_loginPage == LoginPages.email) {
      _changePage(LoginPages.password);
    } else {
      _changePage(LoginPages.email);
    }
  }

  void _changePage(LoginPages newPage) {
    setState(() {
      _loginPage = newPage;
    });
  }

  void _setInputError(String message) {
    setState(() {
      _inputError = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool showEmailInput = _loginPage == LoginPages.email || _loginPage == LoginPages.registerEmail;

    Widget loginUpper = Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(60, 0, 60, 60),
        color: Color(0xff362619),
        // Rounded bottom corners
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        //     color: Color(0xff362619)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginImage(),
            LoginTitle(_loginPage),
            Visibility(
              visible: showEmailInput,
              child: LoginForm(_loginPage, _changePage, _setInputError),
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
          Text(_loginPage.toString() + " " + _getInputPassword()),
          Numpad(_loginPage, _updateInputPassword)
        ]
      ),
    );
  }
}
