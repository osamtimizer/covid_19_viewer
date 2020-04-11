import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ByPrefecture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final covid19 = Provider.of<Covid19Store>(context).covid19;
    return _body(context, covid19);
  }

  Widget _body(BuildContext context, Covid19 covid19) {
    if (covid19 == null) {
      return CircularProgressIndicator();
    }
    final prefecturesMap = covid19.prefecturesMap;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "都道府県別の状況",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _dropdown(context, prefecturesMap),
                ],
              ),
            ),
            _allPrefecturesChart(context, prefecturesMap),
          ],
        ),
      ),
    );
  }

  Widget _dropdown(BuildContext context, List<PrefecturesMap> prefecturesMap) {
    return DropdownButton(
        items: prefecturesMap
            .map((i) => DropdownMenuItem(
                  child: Text(i.ja),
                ))
            .toList(),
        onChanged: (value) {});
  }

  Widget _allPrefecturesChart(
      BuildContext context, List<PrefecturesMap> prefecturesMap) {
    final series =
        ChartUtil.createAllPrefecturesSeries(prefecturesMap, "all prefectures");
    return Container(
      margin: EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: charts.BarChart(
          series,
          animate: true,
          vertical: false,
        ),
      ),
    );
  }
}
