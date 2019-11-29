import 'package:analog_app/components/login/login_input_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/enums.dart';
import 'package:analog_app/utils/login_state.dart';

import 'package:analog_app/components/login/login_input_email.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, state, child) {
        return Visibility(
          visible: (state.page == LoginPages.email || state.page == LoginPages.registerEmail),
          child: LoginInputEmail(_formKey),
          replacement: LoginInputPassword()
        );
      }
    );
  }
}
