import 'package:flutter/material.dart';
import './listView.dart';
import './chart.dart';
import './bottomNavBar.dart';
import './model.dart';
import './datePicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text("Transections",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addTransection()),
              );
            },
          ),
        ],
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(children: <Widget>[
                new DatePicker(),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: new StackedAreaLineCharts.withSampleData()),
                ),
              ]), // _chart("Charts", "55", "chart")),
            ),
            new listView(),
          ],
        ),
      ),
      bottomNavigationBar: new bottomNavBar(),
    );
  }
}
