import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartUtil {
  static List<charts.Series<ChartSeries, DateTime>> createSeries(
      List<ChartSeries> chartSeries, String id) {
    final target =
        chartSeries.sublist(chartSeries.length - 28, chartSeries.length);
    return [
      charts.Series<ChartSeries, DateTime>(
        id: id,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_chartSeries, count) => _chartSeries.date(),
        measureFn: (_chartSeries, count) => _chartSeries.count,
        data: target,
      )
    ];
  }
}
