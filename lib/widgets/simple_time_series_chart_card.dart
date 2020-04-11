import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SimpleTimeSeriesChartCard<T> extends StatelessWidget {
  final List<charts.Series<T, DateTime>> chartSeries;
  final String id;
  SimpleTimeSeriesChartCard({@required this.chartSeries, this.id = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.withOpacity(0.5),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                _chart(context),
              ],
            ),
          ],
        ));
  }

  Widget _chart(BuildContext context) {
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
