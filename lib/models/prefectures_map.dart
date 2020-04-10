import 'package:covid_19_viewer/imports.dart';

class PrefecturesMap {
  int code;
  String ja;
  String en;
  int value;
  PrefecturesMap({
    this.code,
    this.ja,
    this.en,
    this.value,
  });

  factory PrefecturesMap.fromJson(Map<String, dynamic> json) {
    return PrefecturesMap(
        code: json['code'] as int,
        ja: json['ja'] as String,
        en: json['en'] as String,
        value: json['value'] as int);
  }
}
