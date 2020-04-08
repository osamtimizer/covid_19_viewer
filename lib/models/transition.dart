import 'package:covid_19_viewer/imports.dart';

class Transition {
  List<Carrier> carriers;

  Transition({@required this.carriers});

  factory Transition.fromJson(Map<String, dynamic> json) {
    return Transition(
        carriers: (json["carriers"] as List)
            .map((i) => Carrier.fromArray(i))
            .toList());
  }
}
