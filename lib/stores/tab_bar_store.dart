import 'package:covid_19_viewer/imports.dart';

class TabBarStore extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void updateIndex(int index) async {
    assert(index >= 0, "index must be positive value.");
    if (index < 0) {
      return;
    }

    _currentIndex = index;
    notifyListeners();
  }
}
