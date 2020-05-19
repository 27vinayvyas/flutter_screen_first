import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class listView extends StatefulWidget {
  @override
  _listViewState createState() => _listViewState();
}

class _listViewState extends State<listView> {
  int total = 0;

  DocumentReference documentRefe =
      Firestore.instance.collection("Transections").document("0");

  @override
  Widget build(BuildContext context) {
    documentRefe.get().then((datasnapshot) {
      total = datasnapshot.data["Total"];
    });

    return Expanded(
        flex: 1,
        child: Column(children: <Widget>[
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Text(
                  "Today",
                ),
                Spacer(),
                Text(
                  "Total ",
                  style: TextStyle(color: Color(0xff6F7FAF)),
                ),
                Text("\u20B9 " + total.toString(),
                    style: TextStyle(color: Color(0xff6F7FAF))),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: StreamBuilder(
                stream:
                    Firestore.instance.collection("Transections").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text("Loading...");
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length - 1,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 85,
                        child: ListTile(
                          leading: Image.asset("assets/Bitmap (2).png"),
                          title: Row(children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Spacer(),
                                  Text(
                                    snapshot.data.documents[index + 1]["Name"],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    snapshot.data.documents[index + 1]
                                            ["Source"] +
                                        " . 9:05am",
                                    style: TextStyle(
                                        fontSize: 10, color: Color(0xff6F7FAF)),
                                  ),
                                  Spacer(),
                                ]),
                            Spacer(),
                          ]),
                          //Spacer(),
                          trailing: Column(children: <Widget>[
                            Spacer(),
                            Text(
                              "\u20B9 " +
                                  snapshot.data.documents[index + 1]["amount"]
                                      .abs()
                                      .toString(),
                              style: TextStyle(
                                  color: snapshot.data.documents[index + 1]
                                              ["amount"] >
                                          0
                                      ? Color(0xff53C683)
                                      : Color(0xffEE587E)),
                            ),
                            Spacer(),
                          ]),
                          //increment(snapshot.data.documents[index]["amount"]);
                        ),
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
