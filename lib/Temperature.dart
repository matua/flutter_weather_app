import 'package:flutter/material.dart';

class Temperature extends ChangeNotifier {
  var _temperature = 0;

  int getTemperature() => _temperature;

  void incrementCounter() {
    _temperature += 1;
    notifyListeners();
  }
}
