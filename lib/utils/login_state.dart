import 'package:analog_app/utils/enums.dart';
import 'package:flutter/foundation.dart';

class LoginState extends ChangeNotifier {
  String _email = "";
  String _password = "";
  String _token = "";
  String _username = "";
  String _errorText = "";
  LoginPages _loginPage = LoginPages.email;
  LoginSaved _loginSaved = LoginSaved.none;

  String get email => _email;
  String get password => _password;
  String get token => _token;
  String get username => _username;
  String get errorText => _errorText;
  
  LoginPages get page => _loginPage;
  bool get isPageEmail => _loginPage == LoginPages.email || _loginPage == LoginPages.registerEmail;

  LoginSaved get loginSaved => _loginSaved;

  set email(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }
  set password(String newPassword) {
    _password = newPassword;
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
    return "";
  }
  String get hintText {
    if (_loginPage == LoginPages.password || _loginPage == LoginPages.registerPassword) {
      return "Enter passcode\n";
    }
    return "\n";
  }
  String get ctaText {
    if (_loginPage == LoginPages.email) return "Don't have an account? Make one >>";
    if (_loginPage == LoginPages.password) return "Sign in using another account >>";
    if (_loginPage == LoginPages.registerEmail) return "I already have an account >>";
    return "";
  }
  Function get ctaChangePageFunction {
    if (_loginPage == LoginPages.email) return () => page = (LoginPages.registerEmail);
    if (_loginPage == LoginPages.password) return () => page = (LoginPages.email);
    if (_loginPage == LoginPages.registerEmail) return () => page = (LoginPages.email);
    return null;
  }
}
