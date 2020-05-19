import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:submission_first/notifier/date_notifier.dart';

class DatePickerBar extends StatefulWidget {
  @override
  _DatePickerBarState createState() => _DatePickerBarState();
}

class _DatePickerBarState extends State<DatePickerBar> {
  final TextEditingController _controller = new TextEditingController();
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

  var items = [
    'Working a lot harder',
    'Being a lot smarter',
    'Being a self-starter',
    'Placed in charge of trading charter'
  ];
  @override
  Widget build(BuildContext context) {
    Date_Notifier date_notifier = Provider.of<Date_Notifier>(context);
    date_notifier.setDate(selectedDate.toLocal());
    //print("DATE");
    //print(date_notifier.date.toString());
    return Container(
      child: new Column(
        children: [
          new Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Container(
              color: Color(0xffEDEEF1),
              child: new Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset("assets/Group.png"),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                  new Expanded(
                      child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 47,
                    child: new TextField(
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff6F7FAF),
                            fontWeight: FontWeight.bold),
                        controller: _controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: //selectedDate.toString()))
                                "${selectedDate.toLocal()}".split(' ')[0])),
                  )),
                  new PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      _controller.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return items.map<PopupMenuItem<String>>((String value) {
                        return new PopupMenuItem(
                            child: new Text(value), value: value);
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
class DatePicker extends StatefulWidget {
  DatePicker({Key key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
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
*/
