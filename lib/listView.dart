import 'package:flutter/material.dart';

List objects = [
  new SingleTransection("Netflix", "HDFC 0665", 450),
  new SingleTransection("Amzon Prime", "HDFC 0665", 450),
  new SingleTransection("Flipkart", "HDFC 0665", 450),
  new SingleTransection("Snapdeal", "HDFC 0665", 450),
  new SingleTransection("Netflix", "HDFC 0665", 450),
  new SingleTransection("Amzon Prime", "HDFC 0665", 450),
  new SingleTransection("Flipkart", "HDFC 0665", 450),
  new SingleTransection("Snapdeal", "HDFC 0665", 450),
];

Widget listView() {
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
              Text("\u20B9 " + SingleTransection.total.toString()),
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
            child: ListView.builder(
                itemCount: objects.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.landscape),
                    title: Text(objects[index].name),
                    trailing:
                        Text("\u20B9 " + objects[index].amount.toString()),
                  );
                }),
          ),
        ),
      ]));
}

class SingleTransection {
  String name;
  String sources;
  int amount;
  static int total = 0;
  SingleTransection(name, sources, amount) {
    this.name = name;
    this.sources = sources;
    this.amount = amount;
    total = total + amount;
    print(SingleTransection.total);
  }
}
