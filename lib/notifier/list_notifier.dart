// Total sum of amounts for today

import 'dart:async';

import 'package:flutter/material.dart';

class List_Notifier with ChangeNotifier {
  int total = 0;
  int flag = 0;

  int get getTotal => total;

  void setTotal(int amount) {
    total = amount;
    Timer(Duration(milliseconds: 1), () {
      notifyListeners();
    });
  }
}
