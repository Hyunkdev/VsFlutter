import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'griditemprovider.dart';

class Countprovider extends ChangeNotifier {
  int imagecount = 1;
  int _count = 0;
  int _grade = 0;
  bool _check = false;

  int get count => _count;
  int get grade => _grade;
  bool get check => _check;

  Future<void> add(BuildContext context) async {
    _count++;
    _check = false;

    if (_count >= 5) {
      _count = 0;
      _grade++;
      notifyListeners();
    }

    if (_grade >= 3) {
      _grade = 0;
      _check = true;
      Provider.of<GridItemProvider>(context, listen: false)
          .addImage('assets/$imagecount.png');
      imagecount++;

      // await showToast();
      // notifyListeners();
    }
    notifyListeners();
  }

  Future<void> showToast() async {
    Fluttertoast.showToast(
      msg: '새로운 음료 발견',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 20,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
