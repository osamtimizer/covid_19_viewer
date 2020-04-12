import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SimpleTimeSeriesChartCard extends StatelessWidget {
  final String targetType;
  SimpleTimeSeriesChartCard({@required this.targetType});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Covid19Store>(context);
    final prefecturesData = store.covid19.prefecturesData;
    final selectedPrefecture = prefecturesData
        .firstWhere((i) => i.prefectureCode == store.selectedPrefecture.code);
    final chartSeries = ChartUtil.createMultipleSeries(prefecturesData,
        targetType, selectedPrefecture.prefectureCode, targetType, true);
    int total = 0;
    String targetName;

    switch (targetType) {
      case "carrier":
        final target = selectedPrefecture.carriers.last;
        total = target.count;
        targetName = target.ja;
        break;
      case "death":
        final target = selectedPrefecture.deaths.last;
        total = target.count;
        targetName = target.ja;
        break;
      case "discharged":
        final target = selectedPrefecture.discharged.last;
        total = target.count;
        targetName = target.ja;
        break;
      case "pcrTested":
        final target = selectedPrefecture.pcrTested.last;
        total = target.count;
        targetName = target.ja;
        break;
      default:
        assert(false, "target type not found");
        break;
    }
    return _chartCard(
        context, chartSeries, selectedPrefecture.ja, targetName, total);
  }

  Widget _chartCard(
      BuildContext context,
      List<charts.Series<ChartSeries, DateTime>> chartSeries,
      String selectedPrefectureName,
      String targetName,
      int total) {
    return Container(
        color: Colors.grey.withOpacity(0.5),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("$selectedPrefectureNameの$targetName"),
                Text("累計: ${total.toString()}"),
              ],
            ),
            Stack(
              children: <Widget>[
                _chart(context, chartSeries),
              ],
            ),
          ],
        ));
  }

  Widget _chart(BuildContext context,
      List<charts.Series<ChartSeries, DateTime>> chartSeries) {
    return AspectRatio(
      aspectRatio: 1,
      child: charts.TimeSeriesChart(
        chartSeries,
        animate: true,
        dateTimeFactory: const charts.LocalDateTimeFactory(),
      ),
    );
  }
}
