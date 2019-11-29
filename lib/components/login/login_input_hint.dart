import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/login_state.dart';

class LoginInputHint extends StatefulWidget {
  // final LoginPages _page;
  // final String _errorMessage;
  // LoginInputHint(this._page, this._errorMessage);

  @override
  _LoginInputHintState createState() => _LoginInputHintState();
}

class _LoginInputHintState extends State<LoginInputHint> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, state, child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            (state.errorText.isNotEmpty ? state.errorText : state.hintText),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (state.errorText.isEmpty ? Colors.white : Colors.orange),
              fontSize: 14
            ),
          ),
        );
      }
    );
  }
}
