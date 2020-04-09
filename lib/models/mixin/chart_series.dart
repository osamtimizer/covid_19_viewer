import 'package:covid_19_viewer/imports.dart';

class ChartSeries {
  int year;
  int month;
  int day;
  int count;

  DateTime date() {
    return DateTime(year, month, day);
  }
}
