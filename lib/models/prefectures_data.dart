import 'package:covid_19_viewer/imports.dart';

class PrefectureData {
  int prefectureCode;
  String en;
  String ja;
  List<Carrier> carriers;
  List<Death> deaths;
  List<Discharged> discharged;
  List<PCRTested> pcrTested;

  PrefectureData(
      {this.prefectureCode,
      this.en,
      this.ja,
      this.carriers,
      this.deaths,
      this.discharged,
      this.pcrTested});
}
