// For date-wise splitting the transections

import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:core';

class Chart_Notifier with ChangeNotifier {
  Map chartList = new Map<DateTime, int>();

  void addEntry(DateTime dateTime, int amount) {
    if (chartList.containsKey(dateTime)) {
      chartList.update(dateTime, (value) => (value as int) + amount);
    } else {
      chartList[dateTime] = amount;
    }
  }

  void completed() {
    Timer(Duration(milliseconds: 1), () {
      notifyListeners();
      //print("have fun");
    });
  }
}
