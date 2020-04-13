import 'package:covid_19_viewer/imports.dart';
import 'package:http/http.dart' as http;

class Covid19Store extends ChangeNotifier {
  Covid19 _covid19;
  Covid19 get covid19 => _covid19;
  int _selectedPrefectureCode = Constants.Tokyo;
  bool _isFetching = false;
  bool get isFetching => _isFetching;

  PrefecturesMap get selectedPrefecture {
    if (_covid19 == null || _selectedPrefectureCode <= 0) {
      return null;
    }

    return _covid19.prefecturesMap
        .singleWhere((i) => i.code == _selectedPrefectureCode);
  }

  void clearCovid19() {
    _covid19 = null;
    notifyListeners();
  }

  void refreshCovid19() async {
    if (_isFetching) {
      return;
    }

    _isFetching = true;
    final request = Covid19Request(client: http.Client());
    request.fetch().then((value) {
      if (value != null) {
        _covid19 = value;
      }
      _isFetching = false;
      notifyListeners();
    });
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
