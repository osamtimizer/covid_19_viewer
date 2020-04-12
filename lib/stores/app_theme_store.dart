import 'package:covid_19_viewer/imports.dart';

class AppThemeStore extends ChangeNotifier {
  Brightness _brightness = Brightness.dark;
  Brightness get brightness => _brightness;
  ThemeData get themeData {
    if (_brightness == Brightness.light) {
      return ThemeData.light();
    }
    return ThemeData.dark();
  }

  AppThemeStore({Brightness brightness}) {
    if (brightness != null) {
      _brightness = brightness;
    }
  }

  void updateBrightness(Brightness brightness) {
    _brightness = brightness;
    notifyListeners();
  }
}
