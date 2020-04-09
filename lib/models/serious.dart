import 'package:covid_19_viewer/imports.dart';

class Serious with ChartSeries {
  int year;
  int month;
  int day;
  int count;
  Serious(
      {@required this.year,
      @required this.month,
      @required this.day,
      @required this.count});

  factory Serious.fromArray(List<dynamic> array) {
    return Serious(
      year: array[0] as int,
      month: array[1] as int,
      day: array[2] as int,
      count: array[3] as int,
    );
  }
}
