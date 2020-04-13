class Demography {
  int death;
  int serious;
  int other;

  Demography({
    this.death,
    this.serious,
    this.other,
  });

  factory Demography.fromArray(List<dynamic> array) {
    return Demography(
      death: array[0] as int,
      serious: array[1] as int,
      other: array[2] as int,
    );
  }
}
