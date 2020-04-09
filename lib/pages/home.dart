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
        _createSeries(covid19.transition.carriers),
        animate: true,
      ),
    );
  }

  static List<charts.Series<Carrier, DateTime>> _createSeries(
      List<Carrier> carriers) {
    final target = carriers.sublist(carriers.length - 14, carriers.length);
    return [
      charts.Series<Carrier, DateTime>(
        id: 'Carrier',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (carrier, count) =>
            DateTime(carrier.year, carrier.month, carrier.day),
        measureFn: (carrier, count) => carrier.count,
        data: target,
      )
    ];
  }
}
