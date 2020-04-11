import 'package:covid_19_viewer/imports.dart';

class Covid19 {
  Transition transition;
  List<Demography> demography;
  PrefecturesRawData prefecturesRawData;
  List<PrefecturesMap> prefecturesMap;
  List<PrefectureData> prefecturesData;

  Covid19({
    @required this.transition,
    @required this.demography,
    @required this.prefecturesRawData,
    @required this.prefecturesMap,
    @required this.prefecturesData,
  });

  factory Covid19.fromJson(Map<String, dynamic> json) {
    final prefecturesRawData =
        PrefecturesRawData.fromJson(json['prefectures-data']);
    final prefecturesMap = (json["prefectures-map"] as List)
        .map((i) => PrefecturesMap.fromJson(i))
        .toList();
    final prefecturesData = List<PrefectureData>.generate(47, (i) {
      final code = i + 1;
      return PrefectureData(
          prefectureCode: code,
          en: prefecturesMap.singleWhere((i) => i.code == code).en,
          ja: prefecturesMap.singleWhere((i) => i.code == code).ja,
          carriers: prefecturesRawData.carriersByPrefecture(code),
          deaths: prefecturesRawData.deathsByPrefecture(code),
          discharged: prefecturesRawData.dischargedByPrefecture(code),
          pcrTested: prefecturesRawData.pcrTestedByPrefecture(code));
    });

    return Covid19(
        transition: Transition.fromJson(json["transition"]),
        demography: (json["demography"] as List)
            .map((i) => Demography.fromArray(i))
            .toList(),
        prefecturesRawData: prefecturesRawData,
        prefecturesMap: prefecturesMap,
        prefecturesData: prefecturesData);
  }
}
