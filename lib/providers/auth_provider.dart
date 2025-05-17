import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userType;
  Map<String, dynamic>? _userData;

  bool get isAuthenticated => _isAuthenticated;
  String? get userType => _userType;
  Map<String, dynamic>? get userData => _userData;

  void login(String userType, Map<String, dynamic> userData) {
    _isAuthenticated = true;
    _userType = userType;
    _userData = userData;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _userType = null;
    _userData = null;
    notifyListeners();
  }

  void updateUserData(Map<String, dynamic> newData) {
    _userData = {...?_userData, ...newData};
    notifyListeners();
  }
}