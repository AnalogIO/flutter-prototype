import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/colors.dart';
import 'package:analog_app/utils/login_state.dart';

class LoginInputHint extends StatefulWidget {
  @override
  _LoginInputHintState createState() => _LoginInputHintState();
}

class _LoginInputHintState extends State<LoginInputHint> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, state, child) {
        return Padding(
          padding: EdgeInsets.only(top: 16, bottom: 12),
          child: Text(
            (state.errorText.isEmpty)
              ? state.hintText
              : state.errorText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (state.errorText.isEmpty)
                ? AppColors.white
                : AppColors.orange,
              fontSize: 14
            ),
          ),
        );
      }
    );
  }
}
