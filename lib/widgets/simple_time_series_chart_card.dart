import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SimpleTimeSeriesChartCard extends StatelessWidget {
  final String id;
  SimpleTimeSeriesChartCard({this.id = ""});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Covid19Store>(context);
    final prefecturesData = store.covid19.prefecturesData;
    final selectedPrefecture = store.selectedPrefecture;
    final total = prefecturesData
        .firstWhere((i) => i.prefectureCode == store.selectedPrefecture.code)
        .carriers
        .last
        .count;

    final chartSeries = ChartUtil.createMultipleSeries(
        prefecturesData, "carrier", selectedPrefecture.code, "carrier");
    return Container(
        color: Colors.grey.withOpacity(0.5),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("${selectedPrefecture.ja}の感染者数"),
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
