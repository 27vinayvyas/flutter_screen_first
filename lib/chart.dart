// Implements the complete chart component along with the
//date bar (which works as axis of chart)

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_first/notifier/chart_list_sync_notifier.dart';
import 'package:submission_first/notifier/date_notifier.dart';
import 'dart:core';

class ExpenseLineChart extends StatefulWidget {
  @override
  _ExpenseLineChartState createState() => _ExpenseLineChartState();
}

class _ExpenseLineChartState extends State<ExpenseLineChart> {
  List<Color> gradientColors = [
    const Color(0xff724AEA),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    Date_Notifier date_notifier = Provider.of<Date_Notifier>(context);
    Chart_Notifier chart_notifier = Provider.of<Chart_Notifier>(context);

    return Consumer<Date_Notifier>(builder: (context, date, child) {
      return Expanded(
        child: Container(
          height: 50,
          child: Column(children: <Widget>[
            Consumer<Chart_Notifier>(builder: (context, chart, child) {
              return Expanded(
                child: Container(
                  width: double.infinity,
                  child: LineChart(
                    mainData(date.date, chart.chartList),
                  ),
                ),
              );
            }),
            labels(date.date.toString()),
          ]),
        ),
      );
    });
  }

// Fl_Chart Implementation
// Initial value corresponds to current date
// Can Be updated using datePicker Widget

  LineChartData mainData(DateTime date, Map<DateTime, int> chartList) {
    List<FlSpot> spotPoints = [];
    int day = int.parse(date.toString().substring(8, 10));
    spotPoints.add(FlSpot(0, (1).toDouble()));
    for (int i = 1; i <= 7; i++) {
      DateTime d = new DateTime(date.year, date.month, i + day);
      //print(i.toString());
      if (chartList.containsKey(d)) {
        //print("IF");
        //print(d.toString());
        //print(chartList[d].toString());
        spotPoints.add(
            FlSpot(-0.5 + i.toDouble(), (chartList[d] / 1000 + 1).toDouble()));
      } else {
        spotPoints.add(FlSpot(-0.5 + i.toDouble(), (1).toDouble()));
      }
    }
    spotPoints.add(FlSpot(8, (1).toDouble()));

    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      lineTouchData: LineTouchData(getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map((spotIndex) {
          final FlSpot spot = barData.spots[spotIndex];
          if (spot.x == 0 || spot.x == 6) {
            return null;
          }
          return TouchedSpotIndicatorData(
            FlLine(
              color: Color(0xff724AEA),
              strokeWidth: 1,
              dashArray: [2, 2],
            ),
            FlDotData(
              dotSize: 4,
              strokeWidth: 1,
              getDotColor: (spot, percent, barData) => Colors.white,
              getStrokeColor: (spot, percent, barData) => Colors.deepOrange,
            ),
          );
        }).toList();
      }),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: spotPoints,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2.5,
          curveSmoothness: 0.15,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.1)).toList(),
          ),
        ),
      ],
    );
  }

// Bottom Row of Chart

  Container labels(String dateTime) {
    //String date = dateTime.toString();
    int day = int.parse(dateTime.substring(8, 10));
    List<Widget> l = new List<Widget>();
    for (int i = 0; i < 7; i++) {
      l.add(ovel((day + i).toString()));
    }

    return Container(
      height: 105,
      color: Colors.white,
      child: Column(children: <Widget>[
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: l,
        ),
        Spacer(),
      ]),
    );
  }

  Column ovel(String date) {
    if (date.length == 1) date = '0' + date;
    return Column(children: <Widget>[
      ClipOval(
        child: Container(
            color: Color(0xffEDEEF1),
            padding: EdgeInsets.all(10),
            child: Text((date),
                style: TextStyle(
                    color: Color(0xff6F7FAF), fontWeight: FontWeight.bold))),
      ),
      Text(
        "Fri",
        style: TextStyle(color: Color(0xff6F7FAF), fontSize: 12),
      ),
    ]);
  }
}
