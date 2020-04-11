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
        domainFn: (_chartSeries, _) => _chartSeries.date(),
        measureFn: (_chartSeries, _) => _chartSeries.count,
        data: target,
      )
    ];
  }

  static List<charts.Series<PrefecturesMap, String>> createAllPrefecturesSeries(
      List<PrefecturesMap> map, String id, int selectedPrefectureCode) {
    return [
      charts.Series<PrefecturesMap, String>(
        id: id,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (prefectureMap, _) => prefectureMap.ja,
        measureFn: (prefectureMap, _) => prefectureMap.value,
        fillColorFn: (prefectureMap, _) {
          final color = (prefectureMap.code == selectedPrefectureCode)
              ? charts.MaterialPalette.green.shadeDefault
              : charts.MaterialPalette.blue.shadeDefault.darker;
          return color;
        },
        data: map,
      )
    ];
  }
}
