import 'package:covid_19_viewer/imports.dart';

class Covid19Store extends ChangeNotifier {
  Covid19 _covid19;
  Covid19 get covid19 => _covid19;

  void updateCovid19(Covid19 covid19) {
    _covid19 = covid19;
    notifyListeners();
  }
}
