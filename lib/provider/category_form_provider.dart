import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  bool _isAnalog = true;

  bool get isAnalog => _isAnalog;

  set isAnalog(bool value) {
    _isAnalog = value;
    notifyListeners();
  }
}