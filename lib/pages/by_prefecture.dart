import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid_19_viewer/widgets/simple_time_series_chart_card.dart';

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
    return RefreshIndicator(
      onRefresh: () async {
        Provider.of<Covid19Store>(context, listen: false).refreshCovid19();
      },
      child: SingleChildScrollView(
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
              _byPrefecturesChart(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropdown(BuildContext context, List<PrefecturesMap> prefecturesMap) {
    final store = Provider.of<Covid19Store>(context);
    return DropdownButton(
        value: store.selectedPrefecture,
        items: prefecturesMap
            .map((i) => DropdownMenuItem(child: Text(i.ja), value: i))
            .toList(),
        onChanged: (prefecture) {
          Provider.of<Covid19Store>(context, listen: false)
              .updateSelectedPrefecture(prefecture.code);
        });
  }

  Widget _allPrefecturesChart(
      BuildContext context, List<PrefecturesMap> prefecturesMap) {
    prefecturesMap.sort((short, long) => long.value.compareTo(short.value));
    final selectedCode =
        Provider.of<Covid19Store>(context).selectedPrefecture.code;
    final series = ChartUtil.createAllPrefecturesSeries(
        prefecturesMap, "all prefectures", selectedCode);
    return Container(
        margin: EdgeInsets.all(8.0),
        color: Colors.grey.withOpacity(0.7),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "都道府県別の感染者数",
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            AspectRatio(
              aspectRatio: 1 / 2,
              child: charts.BarChart(
                series,
                animate: true,
                vertical: false,
              ),
            ),
          ],
        ));
  }

  Widget _byPrefecturesChart(BuildContext context) {
    final store = Provider.of<ByPrefectureStore>(context);
    return Column(
      children: <Widget>[
        SimpleTimeSeriesChartCard(
            targetType: "carrier",
            type: AvailableCharts.carrier,
            isTotal: store.carrier),
        SimpleTimeSeriesChartCard(
            targetType: "death",
            type: AvailableCharts.death,
            isTotal: store.death),
        SimpleTimeSeriesChartCard(
            targetType: "discharged",
            type: AvailableCharts.discharged,
            isTotal: store.discharged),
        SimpleTimeSeriesChartCard(
          targetType: "pcrTested",
          type: AvailableCharts.pcrTested,
          isTotal: store.pcrTested,
        )
      ],
    );
  }
}
