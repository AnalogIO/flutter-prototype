import 'package:analog_app/utils/enums.dart';
// import 'package:flutter/foundation.dart'; TODO needed?
import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  String _email = "";
  String _password = "";
  String _token = "";
  String _username = "";
  String _errorText = "";

  bool _loginProcessing = false;
  LoginPages _loginPage = LoginPages.email;
  LoginSaved _loginSaved = LoginSaved.none;

  String get email => _email;
  String get password => _password;
  String get token => _token;
  String get username => _username;
  String get errorText => _errorText;
  
  LoginPages get page => _loginPage;
  bool get isPageEmail => _loginPage == LoginPages.email || _loginPage == LoginPages.registerEmail;
  bool get isLoggingIn => _loginProcessing;
  LoginSaved get loginSaved => _loginSaved;

  set email(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }
  set password(String newPassword) {
    _password = newPassword;
    _errorText = "";

    if (_password.length == 4) {
      if (_loginPage == LoginPages.password) logIn();
      else register();
      _password = "";
    }
    notifyListeners();
  }
  set token(String newToken) {
    _token = newToken;
    notifyListeners();
  }
  set username(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }

  set errorText (String newText) {
    _errorText = newText;
    notifyListeners();
  }
  set page (LoginPages newPage) {
    _loginPage = newPage;
    _errorText = "";
    _password = "";
    notifyListeners();
  }
  set loginSaved(LoginSaved newState) {
    _loginSaved = newState;
    notifyListeners();
  }

  String get titleText {
    if (_loginPage == LoginPages.email) return "Sign in";
    if (_loginPage == LoginPages.password) return _email;
    if (_loginPage == LoginPages.registerEmail) return "Register";
    if (_loginPage == LoginPages.registerPassword) return "Register";
    return "";
  }
  String get hintText {
    if (_loginPage == LoginPages.registerPassword) {
      return "Enter a four-digit passcode\n";
    } else if (!isPageEmail) {
      return "Enter passcode\n";
    }
    return "\n";
  }
  String get ctaText {
    if (_loginPage == LoginPages.email) return "Don't have an account? Make one >>";
    if (_loginPage == LoginPages.password) return "Sign in using another account >>";
    if (_loginPage == LoginPages.registerEmail) return "I already have an account >>";
    if (_loginPage == LoginPages.registerPassword) return "Go back >>";
    return "";
  }
  Function get ctaChangePageFunction {
    if (_loginPage == LoginPages.email) return () => page = (LoginPages.registerEmail);
    if (_loginPage == LoginPages.password) return () => page = (LoginPages.email);
    if (_loginPage == LoginPages.registerEmail) return () => page = (LoginPages.email);
    if (_loginPage == LoginPages.registerPassword) return () => page = (LoginPages.registerEmail);
    return null;
  }

  void logIn() {
    // For deactivating numpad & showing loading assets when loading
    _loginProcessing = true;
    notifyListeners();
    
    // TODO handle login
    /// on fail : clear password on fail
    /// on success : save credentials + set _token
    
    // _token = "????";
    _errorText = "Error: Not implemented\nTap (?) to skip";

    _loginProcessing = false;
  }

  void register() {
    // TODO handle register
  }
}
