import 'package:covid_19_viewer/imports.dart';

class Transition {
  final List<Carrier> carriers;
  final List<Case> cases;
  final List<Death> death;
  final List<Discharged> discharged;
  final List<PCRTested> pcrTested;
  final List<Serious> serious;

  Transition({
    @required this.carriers,
    @required this.cases,
    @required this.death,
    @required this.discharged,
    @required this.pcrTested,
    @required this.serious,
  });

  factory Transition.fromJson(Map<String, dynamic> json) {
    return Transition(
      carriers:
          (json["carriers"] as List).map((i) => Carrier.fromArray(i)).toList(),
      cases: (json["carriers"] as List).map((i) => Case.fromArray(i)).toList(),
      death: (json["carriers"] as List).map((i) => Death.fromArray(i)).toList(),
      discharged: (json["carriers"] as List)
          .map((i) => Discharged.fromArray(i))
          .toList(),
      pcrTested: (json["carriers"] as List)
          .map((i) => PCRTested.fromArray(i))
          .toList(),
      serious:
          (json["carriers"] as List).map((i) => Serious.fromArray(i)).toList(),
    );
  }
}
