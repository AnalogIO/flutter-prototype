import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/colors.dart';
import 'package:analog_app/utils/login_state.dart';

class LoginCTA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, state, child) {
        return FlatButton(
          onPressed: () => state.ctaChangePageFunction(),
          child: Text(
            state.ctaText,
            style: TextStyle(
              color: AppColors.white,
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
