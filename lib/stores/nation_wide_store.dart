import 'package:covid_19_viewer/imports.dart';

enum AvailableCharts { carrier, care, discharged, death, serious, pcrTested }

class NationWideStore extends ChangeNotifier {
  bool _carrier;
  bool _care;
  bool _discharged;
  bool _death;
  bool _serious;
  bool _pcrTested;

  bool get carrier => _carrier;
  bool get care => _care;
  bool get discharged => _discharged;
  bool get death => _death;
  bool get serious => _serious;
  bool get pcrTested => _pcrTested;

  NationWideStore() {
    _carrier = true;
    _discharged = true;
    _carrier = true;
    _care = true;
    _death = true;
    _serious = true;
    _pcrTested = true;
  }

  void updateChartType(bool style, AvailableCharts target) {
    assert(style != null || target != null);

    switch (target) {
      case AvailableCharts.carrier:
        _carrier = style;
        break;
      case AvailableCharts.care:
        _care = style;
        break;
      case AvailableCharts.discharged:
        _discharged = style;
        break;
      case AvailableCharts.death:
        _death = style;
        break;
      case AvailableCharts.serious:
        _serious = style;
        break;
      case AvailableCharts.pcrTested:
        _pcrTested = style;
        break;
      default:
        break;
    }

    notifyListeners();
  }
}
