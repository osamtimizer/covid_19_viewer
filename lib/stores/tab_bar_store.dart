import 'package:covid_19_viewer/imports.dart';

class TabBarStore extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  String _errorMessage;
  String get errorMessage => _errorMessage;

  void updateIndex(int index) async {
    assert(index >= 0, "index must be positive value.");
    if (index < 0) {
      return;
    }

    _currentIndex = index;
    notifyListeners();
  }

  void updateError(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
