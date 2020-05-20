//sharing selected date between datePicker and Chart widget

import 'dart:async';
import 'package:flutter/material.dart';

class Date_Notifier with ChangeNotifier {
  DateTime date;

  DateTime get getDate => date;

  void setDate(DateTime dates) {
    date = dates;

    Timer(Duration(milliseconds: 5), () {
      notifyListeners();
    });
  }
}
