import 'package:covid_19_viewer/imports.dart';

class ByPrefecture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final covid19 = Provider.of<Covid19Store>(context).covid19;
    return _body(context, covid19);
  }

  Widget _body(BuildContext context, Covid19 covid19) {
    final prefecturesMap = covid19.prefecturesMap;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[_dropdown(context, prefecturesMap)],
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
}
