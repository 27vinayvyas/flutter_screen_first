import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class addTransection extends StatefulWidget {
  @override
  _addTransectionState createState() => _addTransectionState();
}

class _addTransectionState extends State<addTransection> {
  createEntry() {
    //  DocumentReference documentReference =
    //      Firestore.instance.collection("MyStudents").document("name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
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
                  //getName(name);
                },
              ),
            ),
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
                  //getName(name);
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
