import 'package:flutter/material.dart';

class Countprovider extends ChangeNotifier {
  int _count = 0;
  int _grade = 0;
  bool _check = false;
  int get count => _count;
  int get grade => _grade;
  bool get check => _check;

  add() {
    _count++;
    _check = false;

    if (_count == 20) {
      _count = 0;
      _grade++;
      notifyListeners();
    }

    if (_grade == 3) {
      _grade = 0;
      _check = true;
    }
    notifyListeners();
  }
}
