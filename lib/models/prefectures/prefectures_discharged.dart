class PrefecturesDischarged {
  int year;
  int month;
  int day;
  List<int> data;

  PrefecturesDischarged({
    this.year,
    this.month,
    this.day,
    this.data,
  });

  factory PrefecturesDischarged.fromArray(List<dynamic> array) {
    return PrefecturesDischarged(
      year: array.removeAt(0) as int,
      month: array.removeAt(1) as int,
      day: array.removeAt(2) as int,
      data: array.map((i) => i as int).toList(),
    );
  }
}
