import 'package:covid_19_viewer/imports.dart';

class NationWide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final covid19 = Provider.of<Covid19Store>(context).covid19;
    final tabBarStore = Provider.of<TabBarStore>(context, listen: false);
    tabBarStore.addListener(() {
      if (tabBarStore.errorMessage != null) {
        final snackBar = SnackBar(
          content: Text("エラーが発生しました。通信環境を確認するか、時間を置いてから再度試してみて下さい。"),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      }
    });
    if (covid19 == null) {
      return Center(child: CircularProgressIndicator());
    }
    final store = Provider.of<NationWideStore>(context);
    return RefreshIndicator(
      onRefresh: () async {
        final store = Provider.of<Covid19Store>(context, listen: false);
        store.refreshCovid19();
        Provider.of<TabBarStore>(context, listen: false).clearError();
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
                chartSeries: covid19.transition.carriers,
                id: "感染者数",
                type: AvailableCharts.carrier,
                isTotal: store.carrier),
            SimpleChartCard(
              chartSeries: covid19.transition.cases,
              id: "患者数",
              type: AvailableCharts.care,
              isTotal: store.care,
            ),
            SimpleChartCard(
              chartSeries: covid19.transition.discharged,
              id: "退院者数",
              type: AvailableCharts.discharged,
              isTotal: store.discharged,
            ),
            SimpleChartCard(
              chartSeries: covid19.transition.pcrTested,
              id: "PCR検査人数",
              type: AvailableCharts.pcrTested,
              isTotal: store.pcrTested,
            ),
            SimpleChartCard(
              chartSeries: covid19.transition.serious,
              id: "重症者数",
              type: AvailableCharts.serious,
              isTotal: store.serious,
            ),
            SimpleChartCard(
              chartSeries: covid19.transition.death,
              id: "死亡者数",
              type: AvailableCharts.death,
              isTotal: store.death,
            ),
          ],
        ),
      ),
    );
  }
}
