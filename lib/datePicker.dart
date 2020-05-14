import 'dart:async';
import 'package:flutter/material.dart';

class DartPicker extends StatefulWidget {
  DartPicker({Key key}) : super(key: key);

  @override
  _DartPickerState createState() => _DartPickerState();
}

class _DartPickerState extends State<DartPicker> {
  static DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: <Widget>[
          Text(
            "${selectedDate.toLocal()}".split(' ')[0],
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
          ),
          Spacer(),
          IconButton(
            icon: const Icon(
              Icons.calendar_today,
            ),
            onPressed: () {
              _selectDate(context);
            },
          ),
        ],
      ),
    );
  }
}
