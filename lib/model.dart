import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addTransection extends StatefulWidget {
  @override
  _addTransectionState createState() => _addTransectionState();
}

class _addTransectionState extends State<addTransection> {
  String name, source;
  int amount;

  getName(name) {
    this.name = name;
  }

  getSource(source) {
    this.source = source;
  }

  getAmount(amount) {
    this.amount = int.parse(amount);
  }

  createEntry() {
    DocumentReference documentReference =
        Firestore.instance.collection("Transections").document();

    Map<String, dynamic> entry = {
      "Name": name,
      "Source": source,
      "amount": amount,
    };
    //total = total + amount;
    //print("total" + total.toString());
    documentReference
        .setData(entry); //.whenComplete(() => print("$name created"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Transection"),
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
            Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.purple,
                      onPressed: () {
                        createEntry();
                        Navigator.pop(context);
                      },
                      child: Text("Submit"),
                    )
                  ],
                )),
            //RaisedButton(onPressed: submit())
          ],
        )

        /*Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),*/
        );
  }
}
/*
class SingleTransection {
  String name;
  String source;
  int amount;
  static int total = 0;
  SingleTransection(name, sources, amount) {
    this.name = name;
    this.source = sources;
    this.amount = amount;
    total = total + amount;
    print(SingleTransection.total);
  }
}
*/
