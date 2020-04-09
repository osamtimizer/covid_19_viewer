import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: _carriersChart(context),
      ),
    );
  }

  Widget _carriersChart(BuildContext context) {
    final covid19 = Provider.of<Covid19Store>(context).covid19;
    if (covid19 == null) {
      return CircularProgressIndicator();
    }
    return AspectRatio(
      aspectRatio: 1,
      child: charts.TimeSeriesChart(
        _createSeries(covid19.transition.carriers, "carriers"),
        animate: true,
        defaultRenderer: charts.BarRendererConfig<DateTime>(),
      ),
    );
  }

  static List<charts.Series<ChartSeries, DateTime>> _createSeries(
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
