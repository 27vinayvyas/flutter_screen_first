import 'package:flutter/material.dart';

class Date_Notifier with ChangeNotifier {
  DateTime date;

  DateTime get getDate => date;

  void setDate(DateTime dates) {
    date = dates;
    notifyListeners();
    print(date);
  }
}
