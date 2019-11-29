import 'package:analog_app/utils/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginCTA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, loginState, child) {
        return FlatButton(
          onPressed: () => loginState.ctaChangePageFunction(),
          child: Text(
            loginState.ctaText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline
            ),
          ),
        );
      }
    );
  }
}
