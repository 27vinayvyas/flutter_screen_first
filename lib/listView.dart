import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './model.dart';

class listView extends StatefulWidget {
  @override
  _listViewState createState() => _listViewState();
}

class _listViewState extends State<listView> {
  int total = 0;

  @override
  void initState() {
    super.initState();
    total = 0;
  }

  void increment(int amount) {
    total = total + amount;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Text(
                  "Today",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "Total ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("\u20B9 " + total.toString()),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(10),
              child: StreamBuilder(
                stream:
                    Firestore.instance.collection("Transections").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text("Loading...");
                  //for (int i = 0; i < snapshot.data.documents.length; i++) {
                  //print("jhvhjvhjvkk" + total.toString());
                  //total = total + snapshot.data.documents[i]["amount"];
                  //}
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.landscape),
                        title: Text(snapshot.data.documents[index]["Name"]),
                        trailing: Text("\u20B9 " +
                            snapshot.data.documents[index]["amount"]
                                .toString()),
                        //increment(snapshot.data.documents[index]["amount"]);
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ]));
  }
}

//Widget listView() {
