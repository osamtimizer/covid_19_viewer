import 'package:covid_19_viewer/stores/app_theme_store.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'imports.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppThemeStore()),
        ChangeNotifierProvider(create: (context) => TabBarStore()),
        ChangeNotifierProvider(create: (context) => NationWideStore()),
        ChangeNotifierProvider(create: (context) => ByPrefectureStore()),
      ],
      child: Covid19MaterialApp(),
    );
  }
}

class Covid19MaterialApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<AppThemeStore>(context).themeData,
        debugShowCheckedModeBanner: false,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => Covid19Store(),
            )
          ],
          child: MyHomePage(title: 'Covid 19 Viewer'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    Client client = http.Client();
    if (Constants.isDebug) {
      client = MockClient((_) async {
        final loadData = await rootBundle.loadString("assets/covid19.json");
        return Response(loadData, 200,
            headers: {'content-type': 'application/json; charset=utf-8'});
      });
    }
    final request = Covid19Request(client: client);
    request.fetch().then((value) {
      Provider.of<Covid19Store>(context, listen: false).updateCovid19(value);
    }).catchError((e) {
      Provider.of<TabBarStore>(context, listen: false)
          .updateError(e.toString());
      Crashlytics.instance.recordError(e, StackTrace.current);
    });
    return Home();
  }
}
