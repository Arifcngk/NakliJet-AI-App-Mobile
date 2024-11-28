import 'package:flutter/material.dart';

class PhoneAuthProvider extends ChangeNotifier {
  final List<String> _registeredPhones = [
    "5551234567",
    "5321234567",
    "5331234567",
    "5301234567",
    "5341234567"
  ];
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  // kullanıcı giriş kontorolü

  void authenticated(String phoneNumber) {
    if (_registeredPhones.contains(phoneNumber)) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }
}
