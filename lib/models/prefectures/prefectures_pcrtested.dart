class PrefecturesPCRTested {
  int year;
  int month;
  int day;
  List<int> data;

  PrefecturesPCRTested({
    this.year,
    this.month,
    this.day,
    this.data,
  });

  factory PrefecturesPCRTested.fromArray(List<dynamic> array) {
    return PrefecturesPCRTested(
      year: array.removeAt(0) as int,
      month: array.removeAt(0) as int,
      day: array.removeAt(0) as int,
      data: array.map((i) => i as int).toList(),
    );
  }
}
