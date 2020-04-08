import 'package:covid_19_viewer/imports.dart';

class Covid19 {
  Transition transition;
  Covid19({@required this.transition});

  factory Covid19.fromJson(Map<String, dynamic> json) {
    return Covid19(
      transition: Transition.fromJson(json["transition"]),
    );
  }
}
