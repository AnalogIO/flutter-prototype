import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:analog_app/utils/enums.dart';
import 'package:analog_app/utils/colors.dart';
import 'package:analog_app/utils/login_state.dart';

class LoginInputEmail extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  LoginInputEmail(this._formKey);

  final RegExp _regExEmail = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _errorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.orange, width: 4),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  );
  get _inputField => Consumer<LoginState>(
    builder: (context, state, child) {
      return TextFormField(
        textInputAction: TextInputAction.next,
        
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "Email...",
          contentPadding: EdgeInsets.fromLTRB(24, 16, 64, 16),
          errorStyle: TextStyle(color: AppColors.orange, height: 0, fontSize: 0),
          fillColor: AppColors.white,
          filled: true,
          errorBorder: _errorBorder,
          focusedErrorBorder: _errorBorder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide.none
          )
        ),
        autofocus: true,
        
        onFieldSubmitted: (value) {_formKey.currentState.save();},
        onSaved: (value) {
          // Handle email input
          if (_formKey.currentState.validate()) {
            FocusScope.of(context).unfocus();
            state.email = value;
            state.page = (state.page == LoginPages.email)
              ? LoginPages.password
              : LoginPages.registerPassword;
          }
        },
        validator: (value) {
          if (value.isEmpty) {
            state.errorText = "Enter an email\n";
            return '';
          }
          if (!_regExEmail.hasMatch(value)) {
            state.errorText = "Enter a valid email\n";
            return '';
          }
          return null;
        }
      );
    }
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: _inputField
            ),
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                icon: Icon(Icons.arrow_forward),
                onPressed: () {_formKey.currentState.save();},
                tooltip: "Submit",
              )
            )
          ],
        )
      ),
    );
  }
}