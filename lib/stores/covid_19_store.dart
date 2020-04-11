import 'package:covid_19_viewer/imports.dart';

class Covid19Store extends ChangeNotifier {
  Covid19 _covid19;
  Covid19 get covid19 => _covid19;
  int _selectedPrefectureCode = Constants.Tokyo;

  PrefecturesMap get selectedPrefecture {
    if (_covid19 == null || _selectedPrefectureCode <= 0) {
      return null;
    }

    return _covid19.prefecturesMap
        .singleWhere((i) => i.code == _selectedPrefectureCode);
  }

  void updateCovid19(Covid19 covid19) {
    _covid19 = covid19;
    notifyListeners();
  }

  void updateSelectedPrefecture(int code) {
    if (code <= 0) {
      return;
    }

    _selectedPrefectureCode = code;
    notifyListeners();
  }
}
