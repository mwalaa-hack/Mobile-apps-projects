import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  String? _email;
  String? _password;

  //public getters
  bool get isLoggedIn => _isLoggedIn;
  String? get email => _email;

  //sign up
  void signUp(String username, String password) {
    _email = username;
    _password = password;
    notifyListeners(); //refresh
  }

  //log in
  bool login(String username, String password) {
    if (_email == username && _password == password) {
      _isLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false; //wrong username or password
  }

  //log out
  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
