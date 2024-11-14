import 'package:flutter/material.dart';

class Countprovider extends ChangeNotifier {
  int _count = 0;
  int _grade = 0;
  int get count => _count;
  int get grade => _grade;

  add() {
    _count++;

    if (_count == 20) {
      _count = 0;
      _grade++;
      notifyListeners();
    }
    notifyListeners();
  }
}
