import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;
  bool isActive = false;

  void increaseCounter() {
    count++;
    notifyListeners();
  }

  void decreaseCounter() {
    count--;
    notifyListeners();
  }

  void toggleSwitch(bool value) {
    isActive = value;
    notifyListeners();
  }

  void resetValues() {
    count = 0;
    isActive = false;
    notifyListeners();
  }
}
