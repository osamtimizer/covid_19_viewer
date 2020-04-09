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
        ChartUtil.createSeries(covid19.transition.carriers, "carriers"),
        animate: true,
        defaultRenderer: charts.BarRendererConfig<DateTime>(),
      ),
    );
  }
}
