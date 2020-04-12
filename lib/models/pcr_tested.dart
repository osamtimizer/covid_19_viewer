import 'package:covid_19_viewer/imports.dart';

class PCRTested extends ChartSeries {
  final int year;
  final int month;
  final int day;
  final int count;
  final String ja = "PCR検査人数";
  PCRTested(
      {@required this.year,
      @required this.month,
      @required this.day,
      @required this.count})
      : super(year: year, month: month, day: day, count: count);

  factory PCRTested.fromArray(List<dynamic> array) {
    return PCRTested(
      year: array[0] as int,
      month: array[1] as int,
      day: array[2] as int,
      count: array[3] as int,
    );
  }
}
