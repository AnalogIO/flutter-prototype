import 'package:analog_app/utils/enums.dart';
import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  String _email = "";
  String _password = "";
  String _token = "";
  String _username = "";
  LoginSaved _loginSaved = LoginSaved.none;

  String get email => _email;
  String get password => _password;
  String get token => _token;
  String get username => _username;
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
  set loginSaved(LoginSaved newState) {
    _loginSaved = newState;
    notifyListeners();
  }
}
