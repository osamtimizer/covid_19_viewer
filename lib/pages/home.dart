import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Covid-19 Viewer",
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Header"),
            ),
            ListTile(
              title: Text("プライバシーポリシー"),
              onTap: () {},
            ),
            ListTile(
              title: Text("このアプリについて"),
              onTap: () {},
            ),
          ],
        ),
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
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        ChartCard(chartSeries: covid19.transition.carriers, id: "感染者数"),
        ChartCard(chartSeries: covid19.transition.cases, id: "患者数"),
        ChartCard(chartSeries: covid19.transition.discharged, id: "退院者数"),
        ChartCard(chartSeries: covid19.transition.pcrTested, id: "PCR検査人数"),
        ChartCard(chartSeries: covid19.transition.serious, id: "重症者数"),
        ChartCard(chartSeries: covid19.transition.death, id: "死亡者数"),
      ],
    ));
  }
}
