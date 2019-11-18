import 'package:flutter/material.dart';
import '../components/login_image.dart';
import '../components/login_title.dart';
import '../components/login_input.dart';
import '../components/login_passwordhint.dart';
import '../components/login_cta.dart';
import '../components/numpad.dart';

import '../utils/Request.dart';

enum LoginPageStatus {
  email,
  password,
  registerEmail,
  registerPassword
}

class LoginPage extends StatefulWidget {
  // constructor. need?
  final LoginPageStatus loginPage;
  const LoginPage(this.loginPage);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageStatus _page = LoginPageStatus.email;
  bool _showNumpad = true;

  void _login(String email, int password) async {
    final response = await Request.makeRequest("/test");

    if (response.statusCode == 200) {
    } else {
      Navigator.pushNamed(context, "/");
    }
  }

  void _onHelpPressed() {
    // Navigator.pushNamed(context, '/login/password');
    setState(() => _page = LoginPageStatus.password);
  }

  void _changePage(LoginPageStatus newPage) {
    setState(() {
      _page = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    String loginTitle;
    if (_page == LoginPageStatus.email) loginTitle = "Sign in";
    if (_page == LoginPageStatus.password) loginTitle = "Kian";
    if (_page == LoginPageStatus.registerEmail) loginTitle = "Register";

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
              Padding(
                padding: EdgeInsets.only(top: 24, bottom: 16),
                child: LoginTitle(loginTitle),
          ),
          LoginForm(_changePage),
          LoginPasswordHint(type: LoginInputType.Email),
          LoginCTA("Don't have an account? Make one >>", _changePage)
        ],
      )),
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
          Text(_page.toString()),
          Numpad(_showNumpad)
        ]
      ),
    );
  }
}
