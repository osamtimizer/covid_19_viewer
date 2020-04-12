import 'package:covid_19_viewer/imports.dart';

class NationWide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final covid19 = Provider.of<Covid19Store>(context).covid19;
    if (covid19 == null) {
      return CircularProgressIndicator();
    }
    return RefreshIndicator(
      onRefresh: () async {
        final store = Provider.of<Covid19Store>(context, listen: false);
        store.refreshCovid19();
      },
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "全国の状況",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SimpleChartCard(
                chartSeries: covid19.transition.carriers, id: "感染者数"),
            SimpleChartCard(chartSeries: covid19.transition.cases, id: "患者数"),
            SimpleChartCard(
                chartSeries: covid19.transition.discharged, id: "退院者数"),
            SimpleChartCard(
                chartSeries: covid19.transition.pcrTested, id: "PCR検査人数"),
            SimpleChartCard(
                chartSeries: covid19.transition.serious, id: "重症者数"),
            SimpleChartCard(chartSeries: covid19.transition.death, id: "死亡者数"),
          ],
        ),
      ),
    );
  }
}
