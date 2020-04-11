class PrefecturesDeath {
  int year;
  int month;
  int day;
  List<int> data;

  PrefecturesDeath({
    this.year,
    this.month,
    this.day,
    this.data,
  });

  factory PrefecturesDeath.fromArray(List<dynamic> array) {
    return PrefecturesDeath(
      year: array.removeAt(0) as int,
      month: array.removeAt(0) as int,
      day: array.removeAt(0) as int,
      data: array.map((i) => i as int).toList(),
    );
  }
}
