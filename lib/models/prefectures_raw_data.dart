import 'package:covid_19_viewer/imports.dart';

class PrefecturesRawData {
  List<PrefecturesCarrier> carriers;
  List<PrefecturesDeath> deaths;
  List<PrefecturesDischarged> discharged;
  List<PrefecturesPCRTested> pcrTested;

  PrefecturesRawData({
    this.carriers,
    this.deaths,
    this.discharged,
    this.pcrTested,
  });

  factory PrefecturesRawData.fromJson(Map<String, dynamic> json) {
    return PrefecturesRawData(
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

  List<Carrier> carriersByPrefecture(int code) {
    final result = carriers.map((i) {
      final carrier = Carrier(
          year: i.year, month: i.month, day: i.day, count: i.data[code - 1]);
      return carrier;
    });
    return result.toList();
  }

  List<Death> deathsByPrefecture(int code) {
    return deaths
        .map((i) => Death(
            year: i.year, month: i.month, day: i.day, count: i.data[code - 1]))
        .toList();
  }

  List<Discharged> dischargedByPrefecture(int code) {
    return discharged
        .map((i) => Discharged(
            year: i.year, month: i.month, day: i.day, count: i.data[code - 1]))
        .toList();
  }

  List<PCRTested> pcrTestedByPrefecture(int code) {
    return pcrTested
        .map((i) => PCRTested(
            year: i.year, month: i.month, day: i.day, count: i.data[code - 1]))
        .toList();
  }
}
