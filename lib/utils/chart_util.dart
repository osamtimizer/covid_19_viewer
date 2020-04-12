import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartUtil {
  static charts.Series<ChartSeries, DateTime> createSeries(
      List<ChartSeries> chartSeries,
      String id,
      int limit,
      bool emphasized,
      bool isTotal) {
    final target =
        chartSeries.sublist(chartSeries.length - limit, chartSeries.length);
    return charts.Series<ChartSeries, DateTime>(
      id: id,
      colorFn: (_, __) => emphasized
          ? charts.MaterialPalette.green.shadeDefault
          : charts.Color(r: 238, g: 238, b: 238, a: 25),
      domainFn: (_chartSeries, _) => _chartSeries.date(),
      measureFn: (_chartSeries, index) {
        if (isTotal) {
          return _chartSeries.count;
        }
        if (index == 0) {
          return 0;
        }
        return _chartSeries.count - target[index - 1].count;
      },
      data: target,
    );
  }

  static List<charts.Series<ChartSeries, DateTime>> createMultipleSeries(
      List<PrefectureData> prefecturesData,
      String id,
      int selectedPrefectureCode,
      String targetType,
      bool isTotal) {
    return prefecturesData.map((data) {
      List<ChartSeries> target;
      switch (targetType) {
        case "carrier":
          target = data.carriers;
          break;
        case "death":
          target = data.deaths;
          break;
        case "discharged":
          target = data.discharged;
          break;
        case "pcrTested":
          target = data.pcrTested;
          break;
        default:
          break;
      }
      assert(target != null, "no target available.");
      final selected = data.prefectureCode == selectedPrefectureCode;
      return createSeries(target, data.ja, 21, selected, isTotal);
    }).toList();
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
