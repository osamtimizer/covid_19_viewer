import 'package:covid_19_viewer/imports.dart';

class PrefecturesData {
  List<PrefecturesCarrier> carriers;
  List<PrefecturesDeath> deaths;
  List<PrefecturesDischarged> discharged;
  List<PrefecturesPCRTested> pcrTested;

  PrefecturesData({
    this.carriers,
    this.deaths,
    this.discharged,
    this.pcrTested,
  });

  factory PrefecturesData.fromJson(Map<String, dynamic> json) {
    return PrefecturesData(
      carriers: (json['carriers'] as List)
          .map((i) => PrefecturesCarrier.fromArray(i))
          .toList(),
      deaths: (json['deaths'] as List)
          .map((i) => PrefecturesDeath.fromArray(i))
          .toList(),
      discharged: (json['discharged'] as List)
          .map((i) => PrefecturesDischarged.fromArray(i))
          .toList(),
      pcrTested: (json['pcrtested'] as List)
          .map((i) => PrefecturesPCRTested.fromArray(i))
          .toList(),
    );
  }
}
