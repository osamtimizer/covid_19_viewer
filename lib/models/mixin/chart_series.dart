import 'package:covid_19_viewer/imports.dart';

class ChartSeries {
  int year;
  int month;
  int day;
  int count;
  bool selected = false;

  ChartSeries(
      {@required this.year,
      @required this.month,
      @required this.day,
      @required this.count,
      this.selected});

  DateTime date() {
    return DateTime(year, month, day);
  }
}
