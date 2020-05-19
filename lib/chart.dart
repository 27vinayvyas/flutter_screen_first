import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_first/notifier/date_notifier.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff724AEA),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    Date_Notifier date_notifier = Provider.of<Date_Notifier>(context);

    return Consumer<Date_Notifier>(builder: (context, date, child) {
      print("date");
      return Column(children: <Widget>[
        Expanded(
          child: Container(
            width: double.infinity,
            child: LineChart(
              mainData(),
            ),
          ),
        ),
        labels(date.date.toString()),
      ]);
    });
  }

  LineChartData mainData() {
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
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
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

/*
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SelectionLineHighlight extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SelectionLineHighlight(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SelectionLineHighlight.withSampleData() {
    return new SelectionLineHighlight(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate, behaviors: [
      new charts.LinePointHighlighter(
          showHorizontalFollowLine:
              charts.LinePointHighlighterFollowLineType.none,
          showVerticalFollowLine:
              charts.LinePointHighlighterFollowLineType.nearest),
      new charts.SelectNearest(eventTrigger: charts.SelectionTrigger.tapAndDrag)
    ]);
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 50),
      new LinearSales(3, 40),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        areaColorFn: (_, __) => charts.MaterialPalette.black, //.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
*/
