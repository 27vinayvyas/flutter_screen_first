import 'package:flutter/material.dart';
import 'package:submission_first/notifier/date_notifier.dart';
import 'package:submission_first/notifier/list_notifier.dart';
import 'package:submission_first/notifier/chart_list_sync_notifier.dart';
import './listView.dart';
import './chart.dart';
import './bottomNavBar.dart';
import './new_transection.dart';
import './datePicker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Date_Notifier()),
        ChangeNotifierProvider(create: (_) => List_Notifier()),
        ChangeNotifierProvider(create: (_) => Chart_Notifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
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
      appBar: appbar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(children: <Widget>[
                new DatePickerBar(),
                new ExpenseLineChart(),
              ]), // _chart("Charts", "55", "chart")),
            ),
            new listView(),
          ],
        ),
      ),
      bottomNavigationBar: new bottomNavBar(),
    );
  }

// AppBar Widget
// + button navigates to data input page for adding new transections
  Widget appbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(65),
      child: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Row(children: <Widget>[
          Spacer(),
          Text("Transections",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Spacer()
        ]),
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
        backgroundColor: Color(0xffFBFAFD),
        elevation: 0.0,
      ),
    );
  }
}
