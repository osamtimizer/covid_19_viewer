import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedChartCard extends StatelessWidget {
  final List<Demography> demographies;
  final String id;
  StackedChartCard({@required this.demographies, this.id = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.withOpacity(0.7),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(id),
              ],
            ),
            // Stack(
            //   children: <Widget>[
            //     _chart(context),
            //   ],
            // ),
          ],
        ));
  }

  // widget _chart(buildcontext context) {
  //   return aspectratio(
  //     aspectratio: 1,
  //     child: charts.barchart(
  //       animate: true,
  //     ),
  //   );
  // }
}
