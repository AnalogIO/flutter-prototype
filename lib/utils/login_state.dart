import 'package:analog_app/utils/enums.dart';
import 'package:flutter/foundation.dart';

class LoginState extends ChangeNotifier {
  String _email = "";
  String _password = "";
  String _token = "";
  String _username = "";
  LoginPages _loginPage = LoginPages.email;
  LoginSaved _loginSaved = LoginSaved.none;

  String get email => _email;
  String get password => _password;
  String get token => _token;
  String get username => _username;
  LoginPages get loginPage => _loginPage;
  LoginSaved get loginSaved => _loginSaved;

  set email(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }
  void updatePassword(String digit) {
    _password = _password + digit;
    notifyListeners();
  }
  void resetPassword() {
    _password = "";
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
  void setLoginPage(LoginPages newPage) {
    _loginPage = newPage;
    notifyListeners();
  }
  set loginSaved(LoginSaved newState) {
    _loginSaved = newState;
    notifyListeners();
  }

  String get ctaText {
    if (_loginPage == LoginPages.email) return "Don't have an account? Make one >>";
    if (_loginPage == LoginPages.password) return "Sign in using another account >>";
    if (_loginPage == LoginPages.registerEmail) return "I already have an account >>";
    return "";
  }
  Function get ctaChangePageFunction {
    if (_loginPage == LoginPages.email) return () => setLoginPage(LoginPages.registerEmail);
    if (_loginPage == LoginPages.password) return () => setLoginPage(LoginPages.email);
    if (_loginPage == LoginPages.registerEmail) return () => setLoginPage(LoginPages.email);
    return null;
  }
}
