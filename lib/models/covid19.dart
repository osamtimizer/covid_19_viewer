import 'package:covid_19_viewer/imports.dart';

class Covid19 with ChartSeries {
  Transition transition;
  List<Demography> demography;
  PrefecturesRawData prefecturesRawData;
  List<PrefecturesMap> prefecturesMap;

  Covid19({
    @required this.transition,
    @required this.demography,
    @required this.prefecturesRawData,
    @required this.prefecturesMap,
  });

  factory Covid19.fromJson(Map<String, dynamic> json) {
    return Covid19(
      transition: Transition.fromJson(json["transition"]),
      demography: (json["demography"] as List)
          .map((i) => Demography.fromArray(i))
          .toList(),
      prefecturesRawData: PrefecturesRawData.fromJson(json['prefectures-data']),
      prefecturesMap: (json["prefectures-map"] as List)
          .map((i) => PrefecturesMap.fromJson(i))
          .toList(),
    );
  }
}
