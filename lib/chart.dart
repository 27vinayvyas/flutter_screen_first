import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StackedAreaLineCharts extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedAreaLineCharts(this.seriesList, {this.animate});

  factory StackedAreaLineCharts.withSampleData() {
    return new StackedAreaLineCharts(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    charts.NumericAxisSpec(
        showAxisLine: false, renderSpec: charts.NoneRenderSpec());

    return new charts.LineChart(seriesList,
        defaultRenderer:
            new charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final myFakeDesktopData = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
      new LinearSales(4, 10),
      new LinearSales(5, 28),
      new LinearSales(6, 7),
    ];
    return [
      new charts.Series<LinearSales, int>(
        id: 'Expenditure',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.day,
        measureFn: (LinearSales sales, _) => sales.expense,
        data: myFakeDesktopData,
      ),
    ];
  }
}

class LinearSales {
  final int day;
  final int expense;

  LinearSales(this.day, this.expense);
}
