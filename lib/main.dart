import 'imports.dart';
import 'dart:async';

void main() async {
  if (Constants.isDebug) {
    Crashlytics.instance.enableInDevMode = true;
  }

  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned(() {
    runApp(MainApp());
  }, onError: Crashlytics.instance.recordError);
}
