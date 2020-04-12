import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class SimpleChartCard extends StatelessWidget {
  final List<ChartSeries> chartSeries;
  final String id;
  final bool isTotal;
  final AvailableCharts type;
  SimpleChartCard(
      {@required this.chartSeries,
      this.id = "",
      this.type,
      this.isTotal = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.withOpacity(0.5),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("新規"),
                CupertinoSwitch(
                    value: isTotal,
                    onChanged: (value) {
                      Provider.of<NationWideStore>(context, listen: false)
                          .updateChartType(value, type);
                    }),
                Text("累計"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(id),
                Text("累計: " + chartSeries.last.count.toString()),
              ],
            ),
            Stack(
              children: <Widget>[
                _chart(context),
              ],
            ),
          ],
        ));
  }

  Widget _chart(BuildContext context) {
    final series = ChartUtil.createSeries(chartSeries, id, 28, true);
    return AspectRatio(
      aspectRatio: 1,
      child: charts.TimeSeriesChart(
        [series],
        animate: true,
        defaultRenderer: charts.BarRendererConfig<DateTime>(),
      ),
    );
  }
}
