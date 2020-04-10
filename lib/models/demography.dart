class Demography {
  int death;
  int serious;
  int other;
  int asynmptomatic;
  int checking;

  Demography(
      {this.death,
      this.serious,
      this.other,
      this.asynmptomatic,
      this.checking});

  factory Demography.fromArray(List<dynamic> array) {
    return Demography(
      death: array[0] as int,
      serious: array[1] as int,
      other: array[2] as int,
      asynmptomatic: array[3] as int,
      checking: array[4] as int,
    );
  }
}
