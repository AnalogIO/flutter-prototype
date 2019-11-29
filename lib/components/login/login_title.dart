import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/login_state.dart';

class LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return Consumer<LoginState>(
      builder: (context, loginState, child) {
        return Padding(
        padding: EdgeInsets.only(top: 32, bottom: 16),
        child: Text(
          loginState.titleText,
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
    );
  }
}
