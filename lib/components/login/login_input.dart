import 'package:flutter/material.dart';
import 'package:analog_app/utils/login_pages.dart';

class LoginForm extends StatefulWidget {
  final LoginPages page;
  final Function changePage;
  final Function setInputEmail;
  final Function setInputError;
  const LoginForm(
    this.page,
    this.changePage,
    this.setInputEmail,
    this.setInputError
  );

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _nextIconButton = IconButton(
      splashColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      icon: Icon(Icons.arrow_forward),
      onPressed: () {_formKey.currentState.save();},
      tooltip: "Submit",
    );
  
    return SizedBox(
      height: 50,
      child: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: LoginInput(
                _formKey,
                widget.changePage,
                widget.setInputEmail,
                widget.setInputError
              )
            ),
            Container(
              alignment: Alignment.topRight,
              child: _nextIconButton
            )
          ],
        )
      ),
    );
  }
}

class LoginInput extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final Function changePage;
  final Function setInputEmail;
  final Function setInputError;
  LoginInput(
    this._formKey,
    this.changePage,
    this.setInputEmail,
    this.setInputError
  );

  final RegExp _regExEmail = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _errorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange, width: 2.5),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email...",
        contentPadding: EdgeInsets.fromLTRB(24, 16, 64, 16),
        errorStyle: TextStyle(color: Colors.orange, height: 0, fontSize: 0),
        fillColor: Colors.white,
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
          setInputEmail(value);
          changePage(LoginPages.password);
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          setInputError("Enter an email\n");
          return '';
        }
        if (!_regExEmail.hasMatch(value)) {
          setInputError("Enter a valid email\n");
          return '';
        }
        return null;
      }
    );
  }
}
