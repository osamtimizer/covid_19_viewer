import 'package:covid_19_viewer/imports.dart';

class Carrier extends ChartSeries {
  final int year;
  final int month;
  final int day;
  final int count;
  Carrier(
      {@required this.year,
      @required this.month,
      @required this.day,
      @required this.count})
      : super(year: year, month: month, day: day, count: count);

  factory Carrier.fromArray(List<dynamic> array) {
    return Carrier(
      year: array[0] as int,
      month: array[1] as int,
      day: array[2] as int,
      count: array[3] as int,
    );
  }
}
