import 'package:flutter/material.dart';
import '../components/login_image.dart';
import '../components/login_title.dart';
import '../components/login_input.dart';
import '../components/login_passwordhint.dart';
import '../components/login_cta.dart';
import '../components/numpad.dart';

//Requests
import 'package:analog_app/utils/Request.dart' as Request;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _onTapped() async {

    //Request testing
    //var response = await Request.makeRequest("/");

    // Navigator.pushReplacementNamed(context, '/home'); REPLACE LATER
    Navigator.pushNamed(context, '/home');
  }
  void _onHelpPressed() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // keyboard doesn't push keyboard up
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[IconButton(icon: Icon(Icons.help_outline), onPressed: _onHelpPressed)],
        elevation: 0
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(60, 0, 60, 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                color: Color(0xff362619)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LoginImage(),
                  Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 16),
                    child: LoginTitle('Sign in'),
                  ),
                  LoginForm(),
                  LoginPasswordHint(type: LoginInputType.Email),
                  LoginCTA("Don't have an account? Make one >>")
                ],
              )
            ),
          ),
          Container(child: Numpad())
        ],
      ),
    );
  }
}

