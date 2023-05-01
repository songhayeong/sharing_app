import 'package:flutter/material.dart';

class StepManagerProvider with ChangeNotifier {
  int _currentStep = 0;
  String? _name;
  String? _email;
  String? _password;

  int get currentStep => _currentStep;

  set currentStep(int value) {
    _currentStep = value;
    notifyListeners();
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
    notifyListeners();
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  String? get password => _password;

  set password(String? value) {
    _password = value;
    notifyListeners();
  }
}
