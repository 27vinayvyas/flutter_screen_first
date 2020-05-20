import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:submission_first/notifier/list_notifier.dart';

class addTransection extends StatefulWidget {
  @override
  _addTransectionState createState() => _addTransectionState();
}

class _addTransectionState extends State<addTransection> {
  String name, source;
  int amount;
  int total;
  DateTime date;

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

  Widget dateSelector() {
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
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: //selectedDate.toString()))
                                "${selectedDate.toLocal()}".split(' ')[0])),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getName(name) {
    this.name = name;
  }

  getSource(source) {
    this.source = source;
  }

  getAmount(amount) {
    this.amount = int.parse(amount);
  }

  createEntry(int value) {
    DocumentReference documentReference =
        Firestore.instance.collection("Transections").document();

    Map<String, dynamic> entry = {
      "Name": name,
      "Source": source,
      "amount": amount,
      "dateTime": selectedDate.toLocal(),
    };

    documentReference.setData(entry);

    total = value + amount;

    DocumentReference documentRefe =
        Firestore.instance.collection("Transections").document("0");

    documentRefe.setData({"Total": total});
  }

  @override
  Widget build(BuildContext context) {
    List_Notifier list_notifier =
        Provider.of<List_Notifier>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Transection",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.grey[200],
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
                onChanged: (String name) {
                  getName(name);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Source",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
                onChanged: (String source) {
                  getSource(source);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Amount",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
                onChanged: (String amount) {
                  getAmount(amount);
                },
              ),
            ),
            dateSelector(),
            Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.purple,
                      onPressed: () {
                        createEntry(list_notifier.total);
                        //print(total.toString());
                        list_notifier.setTotal(total);
                        Navigator.pop(context);
                      },
                      child: Text("Submit"),
                    )
                  ],
                )),
          ],
        ));
  }
}
