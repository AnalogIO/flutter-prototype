import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _nextIconButton = IconButton(
      splashColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      icon: Icon(Icons.arrow_forward),
      onPressed: () {_formKey.currentState.save();},
    );
  
    return Form(
      key: _formKey,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: LoginInput(_formKey)
          ),
          Container(
            alignment: Alignment.topRight,
            child: _nextIconButton
          )
        ],
      )
    );
  }
}

class LoginInput extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  LoginInput(key) : this._formKey = key;
  
  final RegExp _regExEmail = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _errorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email...",
        helperText: "", // To ensure consistent height of widget
        contentPadding: EdgeInsets.fromLTRB(24, 16, 64, 16),
        errorStyle: TextStyle(color: Colors.orange),
        fillColor: Colors.white,
        filled: true,
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorBorder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        )
       ),
      autofocus: true,
      onFieldSubmitted: (value) {_formKey.currentState.save();},
      onSaved: (value) {
        if (_formKey.currentState.validate()) {
          FocusScope.of(context).unfocus();
          // _formKey.currentState.reset();
          Navigator.pushNamed(context, '/home');
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter an email';
        }
        if (!_regExEmail.hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      }
    );
  }
}
